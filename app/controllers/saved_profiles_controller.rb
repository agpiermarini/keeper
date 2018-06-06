class SavedProfilesController < ApplicationController
  def show
    saved_profile        = current_user.saved_profiles.find(params[:id])
    @twitter_profile     = TwitterProfileSearch.new(saved_profile.personality_profile.username).profile
    @personality_profile = saved_profile.personality_profile
  end

  def create
    @saved_profile = current_user.saved_profiles.new(saved_profile_params)
    if @saved_profile.save
      flash[:success] = "Profile saved successfully"
      redirect_to dashboard_path
    else
      flash[:danger] = "You have already saved this profile. You will be permitted to save new profiles for this user once they have been generated."
      redirect_to dashboard_path
    end
  end

  def destroy
    @saved_profile = SavedProfile.find(params[:id])
    if @saved_profile.destroy!
      flash[:success] = "Profile deleted successfully"
      redirect_to dashboard_path
    else
      flash[:danger] = "Failed to delete profile"
      redirect_to dashboard_path
    end
  end

  private
    def saved_profile_params
      params.permit(:personality_profile_id)
    end
end
