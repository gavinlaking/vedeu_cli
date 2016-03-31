# frozen_string_literal: true

module Vedeu

  # Provide a command line interface to Vedeu.
  #
  module CLI

    # The main command line interface commands.
    #
    class Main < Thor

      desc 'new <name>', 'Create a skeleton Vedeu client application.'
      long_desc <<-DESC
        `vedeu new <name>` will create a new skeleton Vedeu client application.

        Vedeu creates a new directory, <name>. If this directory already exists
        Vedeu will only add files and subdirectories which are missing. It will
        not overwrite existing files.
      DESC
      # @param name [String]
      # @return [String]
      def new(name)
        Vedeu::CLI::Application.generate(name)
      end

      # 'Specify the interface name lowercase snakecase; e.g. main_interface'

      desc 'view <name>',
           'Create a new interface within the client application.'
      long_desc <<-DESC
        `vedeu view <name>` will create a new interface within the client
        application.

        Having run `vedeu new <name>` and changing into the newly created
        client application directory, executing this command will create a new
        view with associated files. If this view already exists Vedeu will only
        add files and subdirectories which are missing. It will not overwrite
        existing files.
      DESC
      # @param name [String]
      # @return [String]
      def view(name)
        Vedeu::CLI::View.generate(name)
      end

      desc 'version',
           'Print the version.'
      # @return [String]
      def version
        say("vedeu #{Vedeu::VERSION} (vedeu_cli #{Vedeu::CLI::VERSION})")
      end

    end # Main

  end # CLI

end # Vedeu
