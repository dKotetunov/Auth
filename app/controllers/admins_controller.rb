class AdminsController < ApplicationController
  load_and_authorize_resource


  def new
    #binding.pry
    @admin = Admin.new
    @profile = Profile.new

  end

  def edit
    @admin = Admin.find(params[:id])
    @admin = current_admin
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
                format.js{}
      else
        format.html{render action: "edit"}
      end
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.valid? && @admin.save
      @admin.create_profile_admin
      redirect_to admin_log_in_path, :notice => "Signed"
    else
      render "new"
    end
  end
end
