class Api::V1::PlansController < ApplicationController
  include AuthorisationConcerns
  include AuthorisationResponseConcerns
  before_action :authorize_request
  before_action :set_plan, only: [:show, :destroy, :update]

  def index
    @plans = Plan.includes(:user).all
    render layout: 'layouts/api'
  end

  def create
    @plan = current_user.plans.new(plans_params)

    if @plan.save
      @message = "Successfully created"
      render layout: 'layouts/api'
    else
      error_json_response @plan.errors.full_messages, :bad_request
    end
  end

  def show; end

  def update
    if @plan.update(plans_params)
      @message = "Successfully updated"
      render layout: 'layouts/api'
    else
      error_json_response @plan.errors.full_messages, :bad_request
    end
  end

  def destroy
    if @plan.destroy
      success_json_response({message: "Destroyed successfully."})
    else
      error_json_response @plan.errors.full_messages, :bad_request
    end
  end

  private

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end

  def plans_params
    params.require(:plan).permit(:days_per_week, :minutes, :time_of_day, :goals, day_on_week: [])
  end
end
