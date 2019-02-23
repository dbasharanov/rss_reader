FactoryBot.define do
  factory :feed_item do
    feed { nil }
    title { 'MyString' }
    link { 'MyString' }
    pub_date { '2019-02-22 11:58:45' }
  end
end
