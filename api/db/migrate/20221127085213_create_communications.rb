class CreateCommunications < ActiveRecord::Migration[6.1]
  def change
    create_table :communications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subordinate, null: false, foreign_key: true

      t.timestamps
    end

    add_index  :communications, [:user_id, :subordinate_id], unique: true
  end
end
