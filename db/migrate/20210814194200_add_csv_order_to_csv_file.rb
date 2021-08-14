class AddCsvOrderToCsvFile < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_files, :order, :string, array: true, default: []
  end
end
