class ProfilesAdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
    respond_to do |format|
      format.html{}
      format.js{}
    end
    @user = User.all
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
  end

  def update
    @admin = Admin.find(params[:admin_id])
    @profile_admin = @admin.profile_admin
    @profile_admin.update_attributes(params[:@profile_admin])
    respond_to do |format|
      if @profile_admin.update_attributes(params[:@profile_admin])
        format.js {}
      else
        format.html{render 'edit'}
      end
    end
  end
end
