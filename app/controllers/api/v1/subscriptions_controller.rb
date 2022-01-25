class Api::V1::SubscriptionsController < ApplicationController

  include AuthorisationResponseConcerns
  before_action :authorize_request

  def create
    @subscription = current_user.build_subscription(amount: params[:amount], subscription_type: params[:subscription_type],
                                                    token: params[:token], last_four_digits: params[:last_four_digits])

    if @subscription.save
      response = Stripe::Customer.create(email: current_user.email, card: params[:token])
      price = create_stripe_price(params[:subscription_type], params[:amount])
      res = Stripe::Subscription.create({
                                    customer: response.id,
                                    items: [
                                      { price: price  },
                                    ],
                                  })

      current_user.update(stripe_customer_id: response.id, referral: params[:referral_code], stripe_subscription_id: res.id)
      success_json_response({ message: "Successfully created." })
    else
      error_json_response @subscription.errors.full_messages, :bad_request
    end
  end

  def create_stripe_price(subscription_type, amount)
    details = subscription_type == "other" ? StripeDetail.find_by(price: amount) : StripeDetail.find_by(price: subscription_type)

    product_id = if StripeProduct.first.nil?
                   product = Stripe::Product.create({ name: "Meditation Plan" })
                   StripeProduct.create(stripe_product_id: product.id)
                   product.id
                 else
                   StripeProduct.first.stripe_product_id
                 end

    #    Rails.logger.info product_id, "product_id"

    price_id = if details.nil?
                 if subscription_type == "other"
                   price = Stripe::Price.create({ unit_amount: amount.to_i, currency: "usd", recurring: { 'interval': 'month' }, product: product_id })
                   StripeDetail.create(price: amount, stripe_price_id: price.id)
                   price
                 else
                   price = Stripe::Price.create({ unit_amount: subscription_type.to_i, currency: "usd", recurring: { 'interval': 'month' }, product: product_id })
                   StripeDetail.create(price: subscription_type, stripe_price_id: price.id)
                   price
                 end
               end

    price_id.id
  end

  private

  def subscriptions_params
    params.require(:subscription).permit(:amount, :last_four_digits, :token, :subscription_type)
  end
end
