FactoryGirl.define do
  factory :collection do
    sequence(:name) { |n| "Collection #{n}" }
    # sequence(:user_id) { 1 }
  end
end
