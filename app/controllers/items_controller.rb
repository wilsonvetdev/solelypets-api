class ItemsController < ApplicationController

    before_action :authorized

    def create 
        image = Cloudinary::Uploader.upload(params[:image])
        if !!params[:animal_id]
            item = Item.create(image: image["url"], animal_id: params[:animal_id].to_i)
        else
            item = Item.create(image: image["url"], animal_shelter_id: params[:animal_shelter_id].to_i)
        end
        render json: item
    end

end
