class AddBandToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :band, foreign_key: true
  end
end
