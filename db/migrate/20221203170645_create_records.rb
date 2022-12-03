class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.integer :format_size
      t.integer :release_year
      t.boolean :color_vinyl
      t.timestamps
    end
  end
end
