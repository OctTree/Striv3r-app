class Api::V1::RedeemsController < ApplicationController
  before_action :authorize_request

  def create
    UserMailer.send_redeem_email(current_user.id)
  end
end