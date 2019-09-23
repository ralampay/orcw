# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed

# Added by Refinery CMS Events extension
Refinery::Events::Engine.load_seed

# Added by Refinery CMS DownloadableForms extension
Refinery::DownloadableForms::Engine.load_seed

# Added by Refinery CMS PolicyFiles extension
Refinery::PolicyFiles::Engine.load_seed

# Added by Refinery CMS NewsArticles extension
Refinery::NewsArticles::Engine.load_seed
