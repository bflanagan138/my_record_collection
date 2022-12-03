require 'rails_helper'

RSpec.describe Band do
  it { should have_many :records }
end