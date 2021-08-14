class CreateCsvFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_files do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
