class AddClickableToBuzzs < ActiveRecord::Migration[7.1]
  def change
    add_column :buzzs, :clickable, :boolean, default: true
  end
end
