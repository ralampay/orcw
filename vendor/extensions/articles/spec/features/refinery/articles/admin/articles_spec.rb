# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Articles" do
    describe "Admin" do
      describe "articles", type: :feature do
        refinery_login

        describe "articles list" do
          before do
            FactoryBot.create(:article, :title => "UniqueTitleOne")
            FactoryBot.create(:article, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.articles_admin_articles_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.articles_admin_articles_path

            click_link "Add New Article"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Articles::Article, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Articles::Article, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:article, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.articles_admin_articles_path

              click_link "Add New Article"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Articles::Article, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:article, :title => "A title") }

          it "should succeed" do
            visit refinery.articles_admin_articles_path

            within ".actions" do
              click_link "Edit this article"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:article, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.articles_admin_articles_path

            click_link "Remove this article forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Articles::Article.count).to eq(0)
          end
        end

      end
    end
  end
end
