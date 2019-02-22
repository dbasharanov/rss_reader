require 'rails_helper'

RSpec.describe Feed, type: :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.url = "https://www.investor.bg/bulletin/rss/"
    subject.title = "Anything"
    expect(subject).to be_valid
  end

  it "is not valid without an url" do
    expect(subject).to_not be_valid
  end

end
