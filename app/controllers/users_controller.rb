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
            wristband_token = encode_token({user_id: user.id})
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
        wristband_token = encode_token({user_id: @user.id})

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
