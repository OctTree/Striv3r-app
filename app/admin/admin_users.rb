ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :name
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :send_email do
        "<a href='/admin/users/#{user.id}/send_email'>Send Email</a>".html_safe
      end
      panel "Activity Plan" do
        activity_plans = user.activity_plans
        table_for activity_plans do
          column :activity_name
          column :week
          column :time
          column :frequency
          column :activity_at
          column :status
          column do |activity_plan|
            "<a href='/admin/activity_plans/#{activity_plan.id}/approve?activity_plan[status]=approved' data-method='put'>Approve</a>".html_safe
          end
          column do |activity_plan|
            "<a href='/admin/activity_plans/#{activity_plan.id}/edit'>Edit</a>".html_safe
          end
          column do |activity_plan|
            "<a href='/admin/activity_plans/#{activity_plan.id}/' data-method='delete'>Delete</a>".html_safe
          end
        end
      end
    end
  end

  member_action :send_email, method: :get do
    user = User.find(params[:id])
    PlanMailer.send_customized_plan_email(user.id).deliver_now
    redirect_to admin_user_path(user), notice: "Email sent Successfully."
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
