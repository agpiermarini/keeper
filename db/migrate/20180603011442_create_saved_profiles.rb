class CreateSavedProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_profiles do |t|
      t.references :user, foreign_key: true
      t.references :personality_profile, foreign_key: true
    end
  end
end
