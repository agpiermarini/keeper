class AddSourceToPersonalityProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :personality_profiles, :source, :string
  end
end
