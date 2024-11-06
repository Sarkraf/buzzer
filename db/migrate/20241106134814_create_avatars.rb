class CreateAvatars < ActiveRecord::Migration[7.1]
  def change
    create_table :avatars do |t|
      t.string :filename
      t.boolean :taken, default: false

      t.timestamps
    end
  end
end
