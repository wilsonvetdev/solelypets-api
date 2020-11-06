class ItemsController < ApplicationController

    def create 
        image = Cloudinary::Uploader.upload(params[:image])
        # video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
        # video: video["url"]
        item = Item.create(image: image["url"])
        byebug
        # association has to be created here, something like animal.items.create(image: image['url'])
        render json: item
    end

end
