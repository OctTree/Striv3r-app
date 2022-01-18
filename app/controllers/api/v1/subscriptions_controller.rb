class Api::V1::SubscriptionsController < ApplicationController

  include AuthorisationResponseConcerns
  before_action :authorize_request


  def create
    @subscription = current_user.subscription.build(subscriptions_params)

    if @subscription.save
      @message = "Successfully created"
      render layout: 'layouts/api'
    else
      error_json_response @subscription.errors.full_messages, :bad_request
    end
  end


  private

  def subscriptions_params
    params.require(:subscription).permit(:amount, :last_four_digits, :expiry, :stripe_card_id, :token, :subscription_type)
  end
end
