# frozen_string_literal: true

require "minitest/autorun"
require "sangfor"

class SangforTest < Minitest::Test
  def test_version_matches_gemspec
    spec = Gem::Specification.load(File.expand_path("../sangfor.gemspec", __dir__))
    assert_equal Sangfor::VERSION, spec.version.to_s
    assert_equal "sangfor", spec.name
  end

  def test_errors_can_be_rescued_as_standard_errors
    assert_operator Sangfor::Error, :<, StandardError
  end

  def test_package_contains_only_library_and_documentation
    spec = Gem::Specification.load(File.expand_path("../sangfor.gemspec", __dir__))
    assert_equal %w[CHANGELOG.md LICENSE README.md lib/sangfor.rb lib/sangfor/version.rb], spec.files.sort
  end
end
