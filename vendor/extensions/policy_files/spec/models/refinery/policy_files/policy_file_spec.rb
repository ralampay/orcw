require 'spec_helper'

module Refinery
  module PolicyFiles
    describe PolicyFile do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:policy_file,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
