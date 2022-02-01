require "test_helper"

class RustyRoadsTest < Minitest::Test
  def test_it_reverses
    assert_equal "<html><head></head><body><b>apples</b></body></html>", RustyRoads.inline("<b>apples</b>")
  end
end
