ActiveAdmin.register User do
  permit_params :email, :name, :active, :point_balance, :total_point_earned, activity_plans_attributes: [ :id, :activity_name, :time, :week, :frequency, 'activity_at(1i)', 'activity_at(2i)',
                                                           'activity_at(3i)', :status ]

  index do
    selectable_column
    column :name
    column :email
    column :point_balance
    column :total_point_earned
    column :referral_code
    column 'Activity count' do |user|
      user.activity_plans.size
    end
    column 'Status' do |user|
      user.active ? 'Yes' : 'No'
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :referral_code
      row :point_balance
      row :total_point_earned
      row :created_at
      row :send_email do
        "<a href='/admin/users/#{user.id}/send_email'>Send Email</a>".html_safe
      end
      row :approve_all do
        "<a href='/admin/users/#{user.id}/approve_all' data-method='put'>Approve all</a>".html_safe
      end
      panel 'Activity Plan' do
        activity_plans = user.activity_plans
        table_for activity_plans do
          column :activity_name
          column :week
          column :time
          column :frequency
          column :start_date do |activity_plan|
            activity_plan.activity_at
          end
          column :status
          column do |activity_plan|
            "<a href='/admin/activity_plans/#{activity_plan.id}/approve?activity_plan[status]=approved' data-method='put'>Approve</a>".html_safe
          end
          column do |activity_plan|
            "<a href='/admin/activity_plans/#{activity_plan.id}/' data-method='delete'>Delete</a>".html_safe
          end
        end
      end

      panel 'Activity Log' do
        activity_logs = user.activity_logs
        table_for activity_logs do
          column :name
          column :date_at
          column :minutes
        end
      end

    end
  end

  member_action :send_email, method: :get do
    user = User.find(params[:id])
    PlanMailer.send_customized_plan_email(user.id).deliver_now
    redirect_to admin_user_path(user), notice: 'Email sent Successfully.'
  end

  member_action :approve_all, method: :put do
    user = User.find(params[:id])
    user.activity_plans.update_all(status: 'approved')
    redirect_to admin_user_path(user), notice: 'Approved Successfully.'
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |form|
    form.inputs do
      form.input :name
      form.input :email
      form.input :point_balance
      form.input :total_point_earned
      form.input :active
    end
    span class: 'has-one' do
      form.has_many :activity_plans, class: 'has_one' do |f|
        f.input :activity_name, as: :select, collection: ['meditate', 'run', 'walk', 'musical', 'workout', 'journal'], include_blank: 'Select Activity Name'
        f.input :week, required: true
        f.input :time, required: true
        f.input :frequency
        f.input :activity_at, label: 'Start Date'
        f.input :status
      end
    end
    form.actions
  end

end
