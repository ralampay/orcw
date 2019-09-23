
FactoryBot.define do
  factory :news_article, :class => Refinery::NewsArticles::NewsArticle do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

