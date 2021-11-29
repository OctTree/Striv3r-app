class Api::V1::PasswordsController < ApplicationController


  # POST /api/password/forgot
  def forgot
    @user = User.find_by(email: forgot_params)
    @user.send_reset_password_instructions if @user.present?
    success_json_response(message: 'Password reset instructions will be sent if the request email is registered')
  end

  # POST /api/password/reset
  def reset
    reset_token = params[:reset_token]
    @user = User.find_by(reset_password_token: reset_token)
    return error_json_response ['Invalid password reset token'],
                               :not_acceptable if @user.nil? || !@user.reset_password_period_valid?

    if @user.reset_password(update_password_params[:password], update_password_params[:confirm_password])
      @user.update(reset_password_token: nil, reset_password_sent_at: nil)
      success_json_response({message: "Successfully updated"})
    else
      error_json_response @user.errors.full_messages, :bad_request
    end
  end

  def forgot_params
    params.require(:email)
  end

  def update_password_params
    params.permit(:password, :confirm_password)
  end

end