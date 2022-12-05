class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.text :place_point, null: false
      t.references :user, null: false, foreign_key: true
      t.references :subordinate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
