Dotenv.load  

class ApplicationController < ActionController::API

    def encode_token(payload)
        # store secret in env variable
        JWT.encode(payload, secret)
    end

    def secret 
        ENV['JWT_SECRET']
    end

    def auth_header
        # { Authorization: '<token>' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header
            # header: { 'Authorization': '<token>' }

            # If the token is invalid, return nil instead of erroring out
            begin
                JWT.decode(token, secret, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in_user
        if decoded_token && isShelter?
            animal_shelter_id = decoded_token[0]['animal_shelter_id']
            @user = AnimalShelter.find_by(id: animal_shelter_id)
        else decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!logged_in_user
    end

    def check_user
        if decoded_token
            class_name = decoded_token[0]['role']
        end
    end

    def isShelter?
        check_user === 'AnimalShelter'
    end

    def authorized
        render json: { error: 'Please log in' }, status: :unauthorized unless logged_in?
    end
    
end
