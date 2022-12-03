class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.integer :year_formed
      t.boolean :active
      t.timestamps
    end
  end
end
