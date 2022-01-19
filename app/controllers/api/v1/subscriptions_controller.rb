class Api::V1::SubscriptionsController < ApplicationController

  include AuthorisationResponseConcerns
  before_action :authorize_request


  def create
    @subscription = current_user.subscription.build(amount: params[:amount], subscription_type: params[:subscription_type],
                                                    token: params[:token], last_four_digits: params[:last_four_digits])

    if @subscription.save
      response = Stripe::Customer.create(email: current_user.email, card: params[:token])
      current_user.update(stripe_customer_id: response.id)
      @message = "Successfully created"
      render layout: 'layouts/api'
    else
      error_json_response @subscription.errors.full_messages, :bad_request
    end
  end


  private

  def subscriptions_params
    params.require(:subscription).permit(:amount, :last_four_digits, :token, :subscription_type)
  end
end
