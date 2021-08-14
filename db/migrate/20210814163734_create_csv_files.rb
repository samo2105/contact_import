class CreateCsvFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_files do |t|
      t.references :user, null: false, foreign_key: true
      t.int :state

      t.timestamps
    end
  end
end
