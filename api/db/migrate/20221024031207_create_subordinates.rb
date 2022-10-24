class CreateSubordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :subordinates do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
