require 'rails_helper'

RSpec.describe FeedItem, type: :model do
  subject { described_class.new }

  it { is_expected.not_to be_valid }
  
  it { FeedItem.reflect_on_association(:feed).macro.should eq(:belongs_to) }

end
