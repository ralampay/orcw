# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "DownloadableForms" do
    describe "Admin" do
      describe "downloadable_forms", type: :feature do
        refinery_login

        describe "downloadable_forms list" do
          before do
            FactoryBot.create(:downloadable_form, :title => "UniqueTitleOne")
            FactoryBot.create(:downloadable_form, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.downloadable_forms_admin_downloadable_forms_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.downloadable_forms_admin_downloadable_forms_path

            click_link "Add New Downloadable Form"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::DownloadableForms::DownloadableForm, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::DownloadableForms::DownloadableForm, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:downloadable_form, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.downloadable_forms_admin_downloadable_forms_path

              click_link "Add New Downloadable Form"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::DownloadableForms::DownloadableForm, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:downloadable_form, :title => "A title") }

          it "should succeed" do
            visit refinery.downloadable_forms_admin_downloadable_forms_path

            within ".actions" do
              click_link "Edit this downloadable form"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:downloadable_form, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.downloadable_forms_admin_downloadable_forms_path

            click_link "Remove this downloadable form forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::DownloadableForms::DownloadableForm.count).to eq(0)
          end
        end

      end
    end
  end
end
