module Refinery
  module DownloadableForms
    class DownloadableForm < Refinery::Core::BaseModel
      self.table_name = 'refinery_downloadable_forms'


      validates :title, :presence => true, :uniqueness => true

      belongs_to :file, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
