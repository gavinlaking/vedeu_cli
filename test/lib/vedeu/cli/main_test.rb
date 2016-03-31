# frozen_string_literal: true

require 'test_helper'

module Vedeu

  module CLI

    describe Main do

      let(:described) { Vedeu::CLI::Main }
      let(:instance)  { described.new }

      # describe '#new' do
      #   let(:_name) { 'app_name' }

      #   before do
      #     instance.stubs(:say).returns('')
      #     Vedeu::CLI::Application.stubs(:generate).returns('')
      #   end

      #   subject { instance.new(_name) }

      #   it {
      #     instance.expects(:say)
      #     subject
      #   }
      # end

      # describe '#view' do
      #   let(:_name) { 'view_name' }

      #   before do
      #     instance.stubs(:say).returns('')
      #     Vedeu::CLI::View.stubs(:generate).returns('')
      #   end

      #   subject { instance.view(_name) }

      #   it {
      #     Vedeu::CLI::View.expects(:generate).with(_name)
      #     subject
      #   }
      # end

      describe '#version' do
        before { instance.stubs(:say) }

        subject { instance.version }

        it {
          instance.expects(:say)
            #.with("vedeu #{Vedeu::VERSION} (vedeu_cli #{Vedeu::CLI::VERSION})")
          subject
        }
      end

    end # Main

  end # CLI

end # Vedeu
