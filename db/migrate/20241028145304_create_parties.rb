class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :passphrase
      t.string :url

      t.timestamps
    end
  end
end
