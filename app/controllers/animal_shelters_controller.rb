class AnimalSheltersController < ApplicationController

    before_action :authorized, only: [:keep_logged_in]

    def index 
        animal_shelters = AnimalShelter.all 
        render json: animal_shelters
    end

    def login
        animal_shelter = AnimalShelter.find_by(email: params[:email])
        if animal_shelter && animal_shelter.authenticate(params[:password])
            wristband_token = encode_token({animal_shelter_id: animal_shelter.id, role: animal_shelter.class.name})
            render json: {
                user: AnimalShelterSerializer.new(animal_shelter), 
                token: wristband_token,
                role: 'AnimalShelter'
            }
        else
            render json: {error: 'Incorrect email or password! Try again.'}, status: 422
        end
    end


    def create
        animal_shelter = AnimalShelter.create(animal_shelter_params)
        if animal_shelter.valid?
            wristband_token = encode_token({animal_shelter_id: animal_shelter.id, role: animal_shelter.class.name})
            render json: {
                user: AnimalShelterSerializer.new(animal_shelter), 
                token: wristband_token,
                role: 'AnimalShelter'
            }
        else
            render json: {error: 'invalid input'}, status: 422
        end
    end

    private
    def animal_shelter_params
        params.permit(:first_name, :last_name, :name, :email, :address, :city, :state, :password)
    end


end
