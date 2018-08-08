namespace :clear do
  desc "Clear profiles older than 12 hours that have not been saved by users"
  task unsaved: :environment do
    unsaved_profiles = PersonalityProfile.find_by_sql ["SELECT id FROM personality_profiles
                                                        WHERE created_at <= NOW() - '12 HOURS'::Interval
                                                        EXCEPT
                                                        SELECT personality_profile_id FROM saved_profiles;"]

    unsaved_profiles.destroy_all
  end
end
