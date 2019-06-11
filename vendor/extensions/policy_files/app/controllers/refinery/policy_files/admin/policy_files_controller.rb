module Refinery
  module PolicyFiles
    module Admin
      class PolicyFilesController < ::Refinery::AdminController

        crudify :'refinery/policy_files/policy_file'

        private

        # Only allow a trusted parameter "white list" through.
        def policy_file_params
          params.require(:policy_file).permit(:title, :file_id, :is_published, :position)
        end
      end
    end
  end
end
