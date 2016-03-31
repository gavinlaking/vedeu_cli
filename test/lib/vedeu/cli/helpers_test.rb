# frozen_string_literal: true

require 'test_helper'

module Vedeu

  module CLI

    class HelpersTestClass

      include Vedeu::CLI::Helpers

      def initialize(name)
        @name = name
      end

    end # HelpersTestClass

    describe Helpers do

      let(:described) { Vedeu::CLI::Helpers }
      let(:instance)  { Vedeu::CLI::HelpersTestClass.new(_name) }
      let(:_name)     { 'my_first_app' }

      describe '#app_name' do
        before { File.stubs(:read).returns('MyFirstApp') }

        subject { instance.app_name }

        it { subject.must_equal('MyFirstApp') }
      end

      describe '#make_directory' do
        let(:destination) {}

        before { Vedeu.stubs(:log_stdout) }

        subject { instance.make_directory(destination) }

        it {
          FileUtils.expects(:mkdir_p).with(destination)
          subject
        }
      end

      describe '#copy_file' do
        let(:source)      {}
        let(:destination) {}

        before {
          File.stubs(:exist?).returns(false)
          Vedeu.stubs(:log_stdout)
        }

        subject { instance.copy_file(source, destination) }

        context 'when the file exists' do
          before { File.stubs(:exist?).returns(true) }

          it {
            Vedeu.expects(:log_stdout)
            subject
          }
        end

        context 'when the file does not exist' do
          it {
            FileUtils.expects(:cp).with(source, destination)
            subject
          }
        end
      end

      describe '#make_file' do
        let(:source)      {}
        let(:destination) {}

        before {
          File.stubs(:exist?).returns(false)
          Vedeu.stubs(:log_stdout)
        }

        subject { instance.make_file(source, destination) }

        context 'when the file exists' do
          before { File.stubs(:exist?).returns(true) }

          it {
            Vedeu.expects(:log_stdout)
            subject
          }
        end

        context 'when the file does not exist' do
          # @todo Add more tests.
          # it { skip }
        end
      end

      describe '#log_processed_file' do
        let(:destination) { 'some_file.txt' }

        before { Vedeu.stubs(:log_stdout) }

        subject { instance.log_processed_file(destination) }

        it { subject.must_be_instance_of(TrueClass) }
        it {
          Vedeu.expects(:log_stdout).
            with(type: :create, message: 'some_file.txt')
          subject
        }
      end

      describe '#log_skipped_file' do
        let(:destination) { 'some_file.txt' }

        before { Vedeu.stubs(:log_stdout) }

        subject { instance.log_skipped_file(destination) }

        it { subject.must_be_instance_of(TrueClass) }
        it {
          Vedeu.expects(:log_stdout).
            with(type:    :create,
                 message: "some_file.txt \e[31malready exists, skipped.\e[39m")
          subject
        }
      end

      describe '#touch_file' do
        let(:destination) {}

        before { Vedeu.stubs(:log_stdout) }

        subject { instance.touch_file(destination) }

        it {
          FileUtils.expects(:touch).with(destination)
          subject
        }
      end

      describe '#name' do
        let(:_name) { 'My_First_APP' }

        subject { instance.name }

        it { subject.must_be_instance_of(String) }
        it { subject.must_equal('my_first_app') }
      end

      describe '#name_as_class' do
        subject { instance.name_as_class }

        context 'when the name is a single value' do
          let(:_name) { 'VEDEU' }

          it { subject.must_equal('Vedeu') }
        end

        context 'when the name is an underscored value' do
          it { subject.must_equal('MyFirstApp') }
        end

        context 'when the name contains hyphens' do
          let(:_name) { 'hyphenated-APP' }

          it { subject.must_equal('HyphenatedApp')}
        end
      end

      describe '#output' do
        let(:_message) { 'This is a test message.' }

        before { Vedeu.stubs(:log_stdout) }

        subject { instance.output(_message) }

        it { subject.must_be_instance_of(String) }

        it {
          Vedeu.expects(:log_stdout).
            with(type: :info, message: _message)
          subject
        }

        it { subject.must_equal(_message) }
      end

      describe '#parse' do
        let(:source) {}

        subject { instance.parse(source) }

        it {
          Vedeu::Templating::Template.expects(:parse).with(instance, source)
          subject
        }
      end

      describe '#source' do
        subject { instance.source }

        it { subject.must_be_instance_of(String) }

        it { subject.must_match('vedeu/cli/templates/application/.') }
      end

    end # Helpers

  end # CLI

end # Vedeu
