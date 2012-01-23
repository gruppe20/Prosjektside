class UsersController < ApplicationController
  before_filter :check_if_userdb_empty
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  private
  
  def check_if_userdb_empty
     if User.all.blank?
     else
       if current_user
       else
         redirect_to root_path
       end
     end
   end
end