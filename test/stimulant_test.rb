require "test_helper"

class StimulantTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Stimulant::VERSION
  end
end
