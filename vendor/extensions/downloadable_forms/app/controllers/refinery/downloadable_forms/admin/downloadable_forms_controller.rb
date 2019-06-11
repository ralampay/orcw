module Refinery
  module DownloadableForms
    module Admin
      class DownloadableFormsController < ::Refinery::AdminController

        crudify :'refinery/downloadable_forms/downloadable_form'

        private

        # Only allow a trusted parameter "white list" through.
        def downloadable_form_params
          params.require(:downloadable_form).permit(:title, :file_id, :is_published, :position)
        end
      end
    end
  end
end
