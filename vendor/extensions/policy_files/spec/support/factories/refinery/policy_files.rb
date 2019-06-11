
FactoryBot.define do
  factory :policy_file, :class => Refinery::PolicyFiles::PolicyFile do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

