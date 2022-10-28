class CreateSubordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :subordinates do |t|
      t.string :name, null: false
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
