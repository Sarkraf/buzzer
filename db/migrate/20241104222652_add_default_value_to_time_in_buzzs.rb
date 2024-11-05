class AddDefaultValueToTimeInBuzzs < ActiveRecord::Migration[7.1]
  def change
    change_column_default :buzzs, :time, -> { 'CURRENT_TIMESTAMP' }
  end
end
