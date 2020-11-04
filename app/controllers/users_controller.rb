require 'stripe'
require 'dotenv'
Dotenv.load  

class UsersController < ApplicationController

    before_action :authorized, only: [:keep_logged_in]

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            wristband_token = encode_token({user_id: user.id})
            render json: {
                user: UserSerializer.new(user), 
                token: wristband_token
            }
        else
            render json: {error: 'Incorrect email or password! Try again.'}, status: 422
        end
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            wristband_token = encode_token({user_id: user.id, role: user.class.name})
            render json: {
                user: UserSerializer.new(user), 
                token: wristband_token
            }
        else
            render json: {error: 'invalid input'}, status: 422
        end
    end

    def keep_logged_in
        # @user exists here because of the before_action
        wristband_token = encode_token({user_id: @user.id, role: user.class.name})
        render json: {
            user: UserSerializer.new(@user), 
            token: wristband_token
        }
    end

    private

    def user_params
        params.permit(:email, :password, :first_name, :last_name)
    end

end

# Customer Object returned by Stripe API 
# <Stripe::Customer:0x3fea1f0cba18 id=cus_IJhHj5C1zwhA0r> JSON: {
#     "id": "cus_IJhHj5C1zwhA0r",
#     "object": "customer",
#     "address": null,
#     "balance": 0,
#     "created": 1604326762,
#     "currency": null,
#     "default_source": null,
#     "delinquent": false,
#     "description": "My First Test Customer (created for API docs)",
#     "discount": null,
#     "email": "sponge@email.com",
#     "invoice_prefix": "C5FB64B0",
#     "invoice_settings": {"custom_fields":null,"default_payment_method":null,"footer":null},
#     "livemode": false,
#     "metadata": {},
#     "name": "squarepants, spongebob",
#     "next_invoice_sequence": 1,
#     "phone": null,
#     "preferred_locales": [

#     ],
#     "shipping": null,
#     "tax_exempt": "none"
#   }
#   (byebug) customer.id
#   "cus_IJhHj5C1zwhA0r"