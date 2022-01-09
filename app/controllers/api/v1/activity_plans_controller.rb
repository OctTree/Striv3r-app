class Api::V1::ActivityPlansController < ApplicationController
  before_action :authorize_request
  before_action :set_activity_plan, only: [:update, :show]

  def index
    @activity_plans = current_user.activity_plans.where("activity_at >= ? and activity_at <= ? and status = ?", Date.current.beginning_of_month, Date.current.end_of_month, 1).all
  end

  def show; end

  def update
    if @activity_plan.update(activity_plans_params)
      ActivityLog.create(user_id: current_user.id, minutes: @activity.time_spent, date_at: DateTime.current, name: @activity_plan.activity_name)
      @message = "Successfully updated"
      render layout: 'layouts/api'
    else
      error_json_response @activity_plan.errors.full_messages, :bad_request
    end
  end

  private

  def set_activity_plan
    @activity_plan = current_user.activity_plans.find(params[:id])
  end

  def activity_plans_params
    params.require(:activity_plan).permit( :time_spent, :remaining_time, :frequency_finished)
  end
end