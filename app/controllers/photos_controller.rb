class PhotosController < ApplicationController
  def index
    @photos_list = Photo.all
    render({ :template => "photos_templates/index" })
  end

  def photo_details
    photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => photo_id }).first

    @comments_list = @photo.comments
    render({ :template => "photos_templates/details" })
  end

  def delete
    photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => photo_id }).first

    @photo.destroy
    redirect_to("/photos")
  end
  
end
