class SavedProfilesController < ApplicationController
  def create
    @saved_profile = current_user.saved_profiles.new(saved_profile_params)
    if @saved_profile.save
      flash[:success] = "Profile saved successfully"
      redirect_to dashboard_path
    else
      flash[:error] = "Profile already saved"
      redirect_to dashboard_path
    end
  end

  private
    def saved_profile_params
      params.permit(:personality_profile_id)
    end
end
