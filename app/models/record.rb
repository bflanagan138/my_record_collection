class Record < ApplicationRecord
  belongs_to :band

  def self.color
    Record.all.where(color_vinyl: true)
  end
end