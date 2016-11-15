class UsersController < ApplicationController
   before_action :authenticate

  def login
    user = User.find_by(email: params[:email])
         if user
             if user.authenticate(params[:password])
                 render :json => user, status: 200
             else
                 head 401
             end
         else
             render :json => {error: "User not found"}, status: 404
         end
  end

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
    render :json => {error: "User validation fiald",user: user},
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
    user =User.find(params[:id]).destroy

    if user.destroyed?
       render :json => {success:"user deleted"}, status: 200
     else
       render :json => {error: "Error removing user"}, status: 400
     end
 end

  private
  def user_params
     params.require(:user).permit(:first_name,:last_name,:email,:username,:password)
  end


end
