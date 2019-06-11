# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PolicyFiles" do
    describe "Admin" do
      describe "policy_files", type: :feature do
        refinery_login

        describe "policy_files list" do
          before do
            FactoryBot.create(:policy_file, :title => "UniqueTitleOne")
            FactoryBot.create(:policy_file, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.policy_files_admin_policy_files_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.policy_files_admin_policy_files_path

            click_link "Add New Policy File"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::PolicyFiles::PolicyFile, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::PolicyFiles::PolicyFile, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:policy_file, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.policy_files_admin_policy_files_path

              click_link "Add New Policy File"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::PolicyFiles::PolicyFile, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:policy_file, :title => "A title") }

          it "should succeed" do
            visit refinery.policy_files_admin_policy_files_path

            within ".actions" do
              click_link "Edit this policy file"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:policy_file, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.policy_files_admin_policy_files_path

            click_link "Remove this policy file forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::PolicyFiles::PolicyFile.count).to eq(0)
          end
        end

      end
    end
  end
end
