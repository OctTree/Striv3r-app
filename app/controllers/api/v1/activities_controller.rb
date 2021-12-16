class Api::V1::ActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_activity, only: [:update, :destroy, :show]

  def index
    @activities = current_user.activities.all
    render layout: 'layouts/api'
  end

  def create
    @activity = current_user.activities.new(activities_params)

    if @activity.save
      @message = "Successfully created"
      render layout: 'layouts/api'
    else
      error_json_response @activity.errors.full_messages, :bad_request
    end
  end

  def show; end

  def update
    if @activity.update(plans_params)
      @message = "Successfully updated"
      render layout: 'layouts/api'
    else
      error_json_response @activity.errors.full_messages, :bad_request
    end
  end

  def destroy
    if @activity.destroy
      success_json_response({message: "Destroyed successfully."})
    else
      error_json_response @activity.errors.full_messages, :bad_request
    end
  end

  private

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end

  def activities_params
    params.require(:activity).permit(:activity_name, :user_id, :performed_at, :time_spent, :remaining_time)
  end
end