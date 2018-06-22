namespace :clear do
  desc "Clear profiles older than 1 day that have not been saved by users"
  task unsaved: :environment do
    unsaved_profiles = PersonalityProfile.find_by_sql ['SELECT id FROM personality_profiles
                                                        EXCEPT
                                                        SELECT personality_profile_id FROM saved_profiles;']
    unsaved_profiles.destroy_all
  end
end
