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

  def get_profiles
    duration = params[:duration].to_i
    intensity = params[:intensity].to_i
    profiles = Profile.where({ :duration => duration, :intensity => intensity })
    response = {}
    profile_hashes = []
    profiles_response = []
    profiles.each do |profile|
      if profile.class == Profile
        profile_hash = { :profile => profile, :laps => profile.laps}
        profiles_response << profile_hash
      end
    end
    response = { :profiles => profiles_response }
    respond_with(response)
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
    begin
      response = Profile.find(params[:id])
      respond_with(response)
    rescue ActiveRecord::RecordNotFound
      respond_with({:error => "no profile found with that id"})
    end
  end
end
