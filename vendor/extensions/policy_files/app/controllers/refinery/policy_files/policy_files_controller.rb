module Refinery
  module PolicyFiles
    class PolicyFilesController < ::ApplicationController

      before_action :find_all_policy_files
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_file in the line below:
        present(@page)
      end

      def show
        @policy_file = PolicyFile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy_file in the line below:
        present(@page)
      end

    protected

      def find_all_policy_files
        @policy_files = PolicyFile.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policy_files").first
      end

    end
  end
end
