namespace :clear do
  desc "Clear profiles older than 12 hours that have not been saved by users"
  task unsaved: :environment do
    unsaved_profiles = PersonalityProfile.where("created_at < NOW() - '12 HOURS'::Interval")
                                         .where.not(id: SavedProfile.pluck(:personality_profile_id))

    unsaved_profiles.destroy_all
  end
end
