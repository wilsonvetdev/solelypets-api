class AnimalsController < ApplicationController

    before_action :authorized

    def create
        animal = @user.animals.create(animal_params)
        render json: animal
    end

    def destroy
        animal = @user.animals.find(params[:id])
        animal.destroy
        render json: animal
    end

    private
    def animal_params
        params.permit(:name, :species, :description)
    end

end
