class UsersController < ApplicationController
  def index
    @users_list = User.all.order(:username)
    render({ :template => "user_templates/index" })
  end

  def user_details
    user_name = params.fetch("user_name")
    @cur_user = User.where({ :username => user_name }).first

    @own_photos_list = @cur_user.own_photos
    render({ :template => "user_templates/details" })
  end

  def add_user
    user_name = params.fetch("input_username")

    new_user = User.new
    new_user.username = user_name
    new_user.private = false
    new_user.save

    redirect_to("/users/#{new_user.username}")
  end

  def update_user
    user_id = params.fetch("user_id")
    @retrieved_user =  User.where({ :id => user_id }).first

    @retrieved_user.username = params.fetch("input_username")
    @retrieved_user.save

    redirect_to("/users/#{@retrieved_user.username}")
  end
end
