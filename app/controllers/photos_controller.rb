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

  def add_photo
    new_photo =  Photo.new

    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id =  params.fetch("input_owner_id")
    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
  end

  def update_photo
    photo_id = params.fetch("photo_id")
    photo = Photo.where({ :id => photo_id }).first

    photo.image =  params.fetch("input_image")
    photo.caption = params.fetch("input_caption")

    photo.save

    redirect_to("/photos/#{photo_id}")
  end

  def add_comment
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("input_photo_id")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")

    new_comment.save
    redirect_to("/photos/#{new_comment.photo_id}")
  end

end
