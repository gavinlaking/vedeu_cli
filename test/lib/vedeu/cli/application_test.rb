# frozen_string_literal: true

require 'test_helper'

module Vedeu

  module CLI

    describe Application do

      let(:described) { Vedeu::CLI::Application }
      let(:instance)  { described.new(_name) }
      let(:_name)     { 'my_first_app' }

      describe '#initialize' do
        it { instance.must_be_instance_of(described) }
        it { instance.instance_variable_get('@name').must_equal(_name) }
      end

      describe '.generate' do
        # before do
        #   FileUtils.stubs(:cp_r)
        #   FileUtils.stubs(:mkdir)
        #   FileUtils.stubs(:mkdir_p)
        #   FileUtils.stubs(:touch)
        #   File.stubs(:write)
        # end

        subject { instance.generate(_name) }

        # @todo Add more tests.
      end

      describe '#generate' do
        it { instance.must_respond_to(:generate) }
      end

    end # Application

  end # CLI

end # Vedeu
