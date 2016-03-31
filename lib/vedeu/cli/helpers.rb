# frozen_string_literal: true

module Vedeu

  module CLI

    # Provides functionality used by the generators to build the client
    # application.
    #
    # :nocov:
    module Helpers

      include Vedeu::Common

      # @return [String]
      def app_name
        @app_name ||= File.read('./config/app_name')
      end

      # @return [String]
      def app_bin_path
        name + '/bin/'
      end

      # @return [String]
      def app_config_path
        name + '/config/'
      end

      # @return [String]
      def app_controllers_path
        name + '/app/controllers/'
      end

      # @return [String]
      def app_helpers_path
        name + '/app/helpers/'
      end

      # @return [String]
      def app_models_path
        name + '/app/models/'
      end

      # @return [String]
      def app_borders_path
        name + '/app/views/interfaces/borders/'
      end

      # @return [String]
      def app_geometries_path
        name + '/app/views/interfaces/geometries/'
      end

      # @return [String]
      def app_keymaps_path
        name + '/app/models/keymaps/'
      end

      # @return [String]
      def app_views_path
        name + '/app/views/'
      end

      # @param destination [String]
      # @return [void]
      def make_directory(destination)
        log_processed_file(destination)

        FileUtils.mkdir_p(destination)

        true
      end

      # @param source [String]
      # @param destination [String]
      # @return [void]
      def copy_file(source, destination)
        if File.exist?(destination)
          log_skipped_file(destination)

          false

        else
          log_processed_file(destination)

          FileUtils.cp(source, destination)

          true
        end
      end

      # @param source_path [String]
      # @param destination_path [String]
      # @return [void]
      def make_file(source_path, destination_path)
        if File.exist?(destination_path)
          log_skipped_file(destination_path)

          false

        else
          log_processed_file(destination_path)

          File.write(destination_path, parse(source_path))

          true
        end
      end

      # @param destination_path [String]
      # @return [TrueClass]
      def log_processed_file(destination_path)
        Vedeu.log_stdout(type: :create, message: destination_path)

        true
      end

      # @param destination_path [String]
      # @return [TrueClass]
      def log_skipped_file(destination_path)
        Vedeu.log_stdout(type:    :create,
                         message: "#{destination_path} " +
                                  Vedeu::EscapeSequences::Esc.red {
                                    'already exists, skipped.'
                                  })
        true
      end

      # @param destination_path [String]
      # @return [void]
      def touch_file(destination_path)
        log_processed_file(destination_path)

        FileUtils.touch(destination_path)

        true
      end

      # @return [String]
      def name
        @_name ||= @name.downcase
      end
      alias app_root_path name

      # @return [String]
      def name_as_class
        name.downcase.split(/_|-/).map(&:capitalize).join
      end

      # @return [String]
      def output(message = '')
        Vedeu.log_stdout(type: :info, message: message)

        message
      end

      # @param source [String]
      # @return [String]
      def parse(source_path)
        Vedeu::Templating::Template.parse(self, source_path)
      end

      # @return [String]
      def source
        File.dirname(__FILE__) + '/templates/application/.'
      end

    end # Helpers
    # :nocov:

  end # CLI

end # Vedeu
