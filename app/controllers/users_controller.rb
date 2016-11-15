class UsersController < ApplicationController
  def index
    @users= User.all
    render :json => @users, status: 200
  end

  def create
    user= User.create(user_params)

    if user.valid?
       render :json => user, status: 201
     else
       head 400  #sends back a header response with 400 status code, no json data
     end
  end

  private
  def user_params
   params.require(:user).permit(:first_name,:last_name,:email,:username)
  end
end
