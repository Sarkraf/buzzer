class AddAvatarToGroup < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :avatar, null: false, foreign_key: true
  end
end
