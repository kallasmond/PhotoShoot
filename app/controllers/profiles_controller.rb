class ProfilesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  
  def index
    @profiles = Profile.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end
  
  def show
    @profile = Profile.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end
  
  def new
    @profile = Profile.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def create
    @profile = Profile.new(params[:profile].merge(:user_id => current_user.id))

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  
end