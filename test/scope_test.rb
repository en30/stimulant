require "test_helper"

class ScopeTest < Minitest::Test
  def setup
    @slideshow_scope = Stimulant::Scope.new(:slideshow, data: { index: 1 })
    @clipboard_scope = Stimulant::Scope.new(:clipboard, data: { silent: false })
  end

  def assert_equal_as_string(exp, act)
    assert_equal(exp.to_s, act)
  end

  def test_controller
    assert_equal_as_string(@slideshow_scope.controller, "slideshow")
  end

  def test_controller_addition
    assert_equal_as_string(@slideshow_scope.controller + @clipboard_scope.controller, "slideshow clipboard")
  end

  def test_data
    assert_equal(@slideshow_scope.data, { "slideshow-index": 1 })
  end

  def test_data_addition
    assert_equal(@slideshow_scope.data + @clipboard_scope.data, { "slideshow-index": 1, "clipboard-silent": false })
  end

  def test_target
    assert_equal_as_string(@slideshow_scope.target(:slide), "slideshow.slide")
  end

  def test_target_addition
    assert_equal_as_string(@slideshow_scope.target(:slide) + @clipboard_scope.target(:source), "slideshow.slide clipboard.source")
  end

  def test_action
    assert_equal_as_string(@slideshow_scope.action(:next, on: "slide:next", at: :window), "slide:next@window->slideshow#next")
  end
end
