class AdminSessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_profile_path(current_admin), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
