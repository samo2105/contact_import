class AddLogsToCsvFiles < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_files, :logs, :text
  end
end
