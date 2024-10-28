class SetDefaultBuzz < ActiveRecord::Migration[7.1]
  def change
    change_column_default :buzzs, :clicked, false
  end
end
