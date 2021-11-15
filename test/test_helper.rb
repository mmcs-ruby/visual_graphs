# frozen_string_literal: true
require 'simplecov'
$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
SimpleCov.start do
  add_filter %r{/test/}
end
require "visual_graphs"
require "minitest/autorun"
