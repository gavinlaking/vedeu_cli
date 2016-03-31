# frozen_string_literal: true

require 'test_helper'

module Vedeu

  module CLI

    describe View do

      let(:described) { Vedeu::CLI::View }
      let(:instance)  { described.new(_name) }
      let(:_name)     { 'my_first_view' }

      describe '#initialize' do
        it { instance.must_be_instance_of(described) }
        it { instance.instance_variable_get('@name').must_equal(_name) }
      end

      describe '.generate' do
        # before do
        #   FileUtils.stubs(:cp_r)
        #   FileUtils.stubs(:mkdir)
        # end

        subject { described.generate(_name) }

        # @todo
        # it { skip }
      end

      describe '#generate' do
        it { described.must_respond_to(:generate) }
      end

    end # View

  end # CLI

end # Vedeu
