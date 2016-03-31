# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console' if ENV['CONSOLE_COVERAGE']
require 'pry'
require 'minitest/autorun'
require 'minitest/pride' unless ENV['NO_COLOR']
require 'minitest/hell'

module VedeuMiniTestPlugin
  # def before_setup
  #   super
  # end

  # def after_setup
  #   super
  # end

  # def before_teardown
  #   super
  # end

  # def after_teardown
  #   super
  # end
end # VedeuMiniTestPlugin

module MiniTest

  class Spec

    # parallelize_me! # uncomment to unleash hell
    # i_suck_and_my_tests_are_order_dependent! # just incase

    include VedeuMiniTestPlugin

    class << self

      alias_method :context, :describe

    end # Eigenclass

  end # Spec

end # MiniTest

require 'mocha/setup'
require 'vedeu_cli'
