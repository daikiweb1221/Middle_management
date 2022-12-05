class CreateEverydayBehaviors < ActiveRecord::Migration[6.1]
  def change
    create_table :everyday_behaviors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :behaviors_one, null: false
      t.string :behaviors_two, null: false
      t.string :behaviors_three, null: false
      t.string :behaviors_four, null: false
      t.string :behaviors_five, null: false

      t.timestamps
    end
  end
end
