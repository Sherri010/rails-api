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
    #   head 400  #sends back a header response with 400 status code, no json data
    render :json => {error: "User validation fiald"},
    status: 400
     end
  end

  def edit
    user =User.find(params[:id])
    render :json => user,status: 200
  end
  #update
  def update
       user =User.find(params[:id]).update_attributes(user_params)
     if user
       render :json => {success:"USer updated"},status:204
     else
       render :json => {error:"fail to update"}, status: 400
     end
  end

 def destroy
    User.find(params[:id]).delete
 end

  private
  def user_params
   params.require(:user).permit(:first_name,:last_name,:email,:username)
  end
end
