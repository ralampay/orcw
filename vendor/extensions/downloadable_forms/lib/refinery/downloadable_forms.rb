require 'refinerycms-core'

module Refinery
  autoload :DownloadableFormsGenerator, 'generators/refinery/downloadable_forms_generator'

  module DownloadableForms
    require 'refinery/downloadable_forms/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
