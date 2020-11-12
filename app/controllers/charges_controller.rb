class ChargesController < ApplicationController

    before_action :authorized, only: [:create]

    def create
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        session = Stripe::Checkout::Session.create({
            customer: @user.customer_id,
            client_reference_id: params[:animal_shelter_id],
            payment_method_types: ['card'],
            line_items: [{
                price_data: {
                    currency: 'usd',
                    product_data: {
                    name: 'Donation to animal shelter',
                },
                unit_amount: params[:amount].to_i * 100,
                },
                quantity: 1,
            }],
            mode: 'payment',
            # For now leave these URLs as placeholder values.
            #
            # Later on in the guide, you'll create a real success page, but no need to
            # do it yet.
            success_url: 'http://localhost:3001/user_home',
            cancel_url: "http://localhost:3001/animal_shelters/#{params[:animal_shelter_id]}",
        })
        render json: { id: session.id }
    end

end
