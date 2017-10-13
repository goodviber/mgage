require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { should have_many(:votes).dependent(:destroy) }
  it { should have_many(:candidates).dependent(:destroy) }

  it { should validate_presence_of(:title) }
end
