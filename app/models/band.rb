class Band < ApplicationRecord
  has_many :records

  def records_count
    records.count
  end
end