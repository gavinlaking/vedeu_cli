module Vedeu

  module CLI

    # Generates a view for the client application.
    #
    # @example
    #   ```bash
    #   vedeu view main_screen
    #   ```
    #
    # :nocov:
    class View

      include Vedeu::CLI::Helpers

      # @see Vedeu::CLI::View#initialize
      def self.generate(name)
        new(name).generate
      end

      # Returns a new instance of Vedeu::CLI::View.
      #
      # @param name [String] The name of the view.
      # @return [Vedeu::CLI::View]
      def initialize(name)
        @name = name
      end

      # @return [void]
      def generate
        make_controller_file
        make_helper_file
        make_keymap_file
        make_interface_file
        make_template_file
        make_view_class_file

        output("Please update the 'root' setting in " \
               "'config/configuration.rb' to start Vedeu using this " \
               "controller and action: (args are optional)\n\n" \
               "Vedeu.configure do\n" \
               "  root :some_controller, :show, *args\n" \
               "end\n\n".freeze)
      end

      private

      # @return [void]
      def make_controller_file
        make_file(source + '/app/controllers/name.erb'.freeze,
                  '.' + "/app/controllers/#{name}_controller.rb".freeze)
      end

      # @return [void]
      def make_helper_file
        make_file(source + '/app/helpers/name.erb'.freeze,
                  '.' + "/app/helpers/#{name}_helper.rb".freeze)
      end

      # @return [void]
      def make_keymap_file
        make_file(source + '/app/models/keymaps/name.erb'.freeze,
                  '.' + "/app/models/keymaps/#{name}.rb".freeze)
      end

      # @return [void]
      def make_interface_file
        make_file(source + '/app/views/interfaces/name.erb'.freeze,
                  '.' + "/app/views/interfaces/#{name}.rb".freeze)
      end

      # @return [void]
      def make_template_file
        touch_file('.' + "/app/views/templates/#{name}.erb".freeze)
      end

      # @return [void]
      def make_view_class_file
        make_file(source + '/app/views/name.erb'.freeze,
                  '.' + "/app/views/#{name}.rb".freeze)
      end

    end # View
    # :nocov:

  end # CLI

end # Vedeu
