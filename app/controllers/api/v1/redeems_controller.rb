class Api::V1::RedeemsController < ApplicationController
  before_action :authorize_request

  def create
    point_redeem = current_user.point_redeems.new(redeems_params)
    if point_redeem.save
      current_user.update(point_balance: 0, total_point_earned: 0)
      success_json_response({message: "Created successfully."})
    else
      error_json_response point_redeem.errors.full_messages, :bad_request
    end
  end

  private

  def redeems_params
    params.require(:point_redeem).permit(:redeemed_point)
  end
end