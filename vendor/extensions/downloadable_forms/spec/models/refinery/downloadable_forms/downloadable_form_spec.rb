require 'spec_helper'

module Refinery
  module DownloadableForms
    describe DownloadableForm do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:downloadable_form,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
