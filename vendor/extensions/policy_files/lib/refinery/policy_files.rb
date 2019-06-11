require 'refinerycms-core'

module Refinery
  autoload :PolicyFilesGenerator, 'generators/refinery/policy_files_generator'

  module PolicyFiles
    require 'refinery/policy_files/engine'

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
