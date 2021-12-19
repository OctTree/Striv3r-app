class Api::V1::ActivityPlansController < ApplicationController
  before_action :authorize_request

  def index
    @activity_plans = current_user.activity_plans.where("activity_at >= ? and activity_at <= ?", Date.current.beginning_of_month, Date.current.end_of_month).all
  end
end