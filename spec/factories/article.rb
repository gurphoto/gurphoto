Factory.sequence :seq do |n|
    n
end

FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "#{n} Zombies!"}
    add_attribute(:sequence) { Factory.next(:seq) }

    description 'article_description'
    content 'article_content'
  end
end
