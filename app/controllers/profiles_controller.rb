class ProfilesController < ApplicationController
  respond_to :json

  def index
    @profiles = Profile.all
    @laps = Lap.all
  end

  def get_profile
    duration = params[:duration].to_i
    intensity = params[:intensity].to_i
    profile = Profile.where({ :duration => duration, :intensity => intensity }).first
    response = { :profile => profile, :laps => profile.laps }
    respond_with(response)
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
end
