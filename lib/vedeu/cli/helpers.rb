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
        @app_name ||= File.read('./config/app_name'.freeze)
      end

      # @return [String]
      def app_bin_path
        name + '/bin/'.freeze
      end

      # @return [String]
      def app_config_path
        name + '/config/'.freeze
      end

      # @return [String]
      def app_controllers_path
        name + '/app/controllers/'.freeze
      end

      # @return [String]
      def app_helpers_path
        name + '/app/helpers/'.freeze
      end

      # @return [String]
      def app_models_path
        name + '/app/models/'.freeze
      end

      # @return [String]
      def app_keymaps_path
        name + '/app/models/keymaps/'.freeze
      end

      # @return [String]
      def app_views_path
        name + '/app/views/'.freeze
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

      # @param source [String]
      # @param destination [String]
      # @return [void]
      def make_file(source, destination)
        if File.exist?(destination)
          log_skipped_file(destination)

          false

        else
          log_processed_file(destination)

          File.write(destination, parse(source))

          true
        end
      end

      # @param destination [String]
      # @return [TrueClass]
      def log_processed_file(destination)
        Vedeu.log_stdout(type: :create, message: "#{destination}".freeze)

        true
      end

      # @param destination [String]
      # @return [TrueClass]
      def log_skipped_file(destination)
        Vedeu.log_stdout(type:    :create,
                         message: "#{destination} " +
                                  Vedeu::EscapeSequences::Esc.red {
                                    'already exists, skipped.'
                                  })
        true
      end

      # @param destination [String]
      # @return [void]
      def touch_file(destination)
        log_processed_file(destination)

        FileUtils.touch(destination)

        true
      end

      # @return [String]
      def name
        @_name ||= @name.downcase
      end
      alias_method :app_root_path, :name

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
      def parse(source)
        Vedeu::Templating::Template.parse(self, source)
      end

      # @return [String]
      def source
        File.dirname(__FILE__) + '/templates/application/.'.freeze
      end

    end # Helpers
    # :nocov:

  end # CLI

end # Vedeu
