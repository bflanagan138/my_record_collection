require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should belong_to :band }
end