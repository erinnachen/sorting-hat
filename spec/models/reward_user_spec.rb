require "rails_helper"

RSpec.describe RewardUser, type: :model do
  it { should belong_to :user }
  it { should belong_to :reward }
  it { should validate_presence_of :user }
  it { should validate_presence_of :reward }
end
