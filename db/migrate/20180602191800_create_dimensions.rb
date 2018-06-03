class CreateDimensions < ActiveRecord::Migration[5.2]
  def change
    create_table :dimensions do |t|
      t.text :name
      t.decimal :percentile
      t.references :personality_profile, foreign_key: true

      t.timestamps null: false
    end
  end
end
