class CreateBuzzs < ActiveRecord::Migration[7.1]
  def change
    create_table :buzzs do |t|
      t.datetime :time
      t.boolean :clicked
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
