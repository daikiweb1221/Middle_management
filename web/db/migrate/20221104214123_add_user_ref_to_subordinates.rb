class AddUserRefToSubordinates < ActiveRecord::Migration[6.1]
  def change
    add_reference :subordinates, :user, foreign_key: true
  end
end
