class CreateFacets < ActiveRecord::Migration[5.2]
  def change
    create_table :facets do |t|
      t.text :name
      t.decimal :percentile
      t.references :dimension, foreign_key: true

      t.timestamps null: false
    end
  end
end
