
FactoryBot.define do
  factory :downloadable_form, :class => Refinery::DownloadableForms::DownloadableForm do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

