module Vedeu

  module CLI

    # Generates the client application directory and file structure.
    #
    # @example
    #   ```bash
    #   vedeu new your_app_name_here
    #   ```
    #
    # :nocov:
    class Application

      include Vedeu::CLI::Helpers

      # @param name [String] The name of the application.
      # @return [Vedeu::CLI::Application]
      def self.generate(name)
        new(name).generate
      end

      # Returns a new instance of Vedeu::CLI::Application.
      #
      # @param name [String] The name of the application.
      # @return [Vedeu::CLI::Application]
      def initialize(name)
        @name = name
      end

      # @return [void]
      def generate
        make_directory_structure

        copy_app_root_files
        copy_application_bootstrapper
        copy_application_controller
        copy_application_helper
        copy_global_keymap
        copy_application_executable
        make_application_executable
        copy_configuration
        copy_app_name
      end

      private

      # @return [void]
      def make_directory_structure
        directories.each { |directory| make_directory(name + directory) }
      end

      # @return [void]
      def copy_application_bootstrapper
        make_file(source + '/application.erb'.freeze,
                  app_root_path + '/application.rb'.freeze)
      end

      # @return [void]
      def copy_application_controller
        make_file(source + '/app/controllers/application_controller.erb'.freeze,
                  app_controllers_path + 'application_controller.rb'.freeze)
      end

      # @return [void]
      def copy_application_executable
        copy_file(source + '/bin/name', app_bin_path + "#{name}")
      end

      # @return [void]
      def copy_application_helper
        make_file(source + '/app/helpers/application_helper.erb'.freeze,
                  app_helpers_path + 'application_helper.rb'.freeze)
      end

      # @return [void]
      def copy_configuration
        make_file(source + '/config/configuration.erb'.freeze,
                  app_config_path + 'configuration.rb'.freeze)
      end

      # @return [void]
      def copy_app_name
        make_file(source + '/config/app_name.erb'.freeze,
                  app_config_path + 'app_name'.freeze)
      end

      # @return [void]
      def copy_app_root_files
        [
          '/Gemfile'.freeze,
          '/.gitignore'.freeze,
          '/LICENSE.txt'.freeze,
          '/README.md'.freeze,
          '/.ruby-version'.freeze,
        ].each do |file|
          copy_file((source + file), (app_root_path + file))
        end
      end

      # @return [void]
      def make_application_executable
        FileUtils.chmod(0755, "#{name}/bin/#{name}".freeze)
      end

      # @return [void]
      def copy_global_keymap
        copy_file(source + '/app/models/keymaps/_global_.rb'.freeze,
                  app_keymaps_path + '_global_.rb'.freeze)
      end

      # @return [Array<String>]
      def directories
        [
          '/app/controllers'.freeze,
          '/app/helpers'.freeze,
          '/app/models/keymaps'.freeze,
          '/app/views/interfaces'.freeze,
          '/app/views/interfaces/borders'.freeze,
          '/app/views/interfaces/geometries'.freeze,
          '/app/views/templates'.freeze,
          '/bin'.freeze,
          '/config'.freeze,
          '/lib'.freeze,
          '/log'.freeze,
          '/test'.freeze,
          '/vendor'.freeze,
        ]
      end

    end # Application
    # :nocov:

  end # CLI

end # Vedeu
