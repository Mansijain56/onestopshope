class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_variable, only: %i[show edit update] 

  def show
  end

  def edit
  end

  def update
    
    if @profile.update(profile_params)
      redirect_to profile_url(@profile), notice: "Your profile has been successfully updated"
    end

  end


  private

  def profile_params
    params.require(:profile).permit(:name, :age, :gender, :avatar)
  end

  def profile_variable
    @profile = Profile.find(params[:id])
  end
end

