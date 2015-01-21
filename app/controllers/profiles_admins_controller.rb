class ProfilesAdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
    respond_to do |format|
      format.html{}
      format.js{}
    end
    @users = User.all
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
  end

  def update
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
    @profile_admin.update_attributes(params[:@profiles_admin])
    respond_to do |format|
      if @profile_admin.update_attributes(params[:@profiles_admin])
        format.js {}
      else
        format.html{render 'edit'}
      end
    end
  end
end
