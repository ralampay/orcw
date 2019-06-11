module Refinery
  module DownloadableForms
    class DownloadableFormsController < ::ApplicationController

      before_action :find_all_downloadable_forms
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @downloadable_form in the line below:
        present(@page)
      end

      def show
        @downloadable_form = DownloadableForm.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @downloadable_form in the line below:
        present(@page)
      end

    protected

      def find_all_downloadable_forms
        @downloadable_forms = DownloadableForm.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/downloadable_forms").first
      end

    end
  end
end
