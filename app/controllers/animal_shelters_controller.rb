class AnimalSheltersController < ApplicationController

    def index 
        animal_shelters = AnimalShelter.all 
        render json: animal_shelters
    end

end
