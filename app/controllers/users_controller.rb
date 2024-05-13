class UsersController < ApplicationController

  def index
    @users_list = User.all.order(:username)
    render({:template => "user_templates/index"})
  end

  def user_details
    user_name =  params.fetch("user_name")
    @cur_user = User.where({:username => user_name}).first

    @own_photos_list = @cur_user.own_photos
    render({:template => "user_templates/details"})
  end

end
