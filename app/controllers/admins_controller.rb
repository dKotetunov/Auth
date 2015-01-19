class AdminsController < ApplicationController
  def index
    @user = User.all
  end

  def new
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
        format.html {redirect_to edit_user_path, notice: "Admin info was changed"}
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
      @admin.create_profile
      redirect_to log_in_path, :notice => "Signed"
    else
      render "new"
    end
  end
end
