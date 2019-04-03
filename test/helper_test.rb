require "test_helper"
require "action_view"

class HelperTest < ActionView::TestCase
  tests Stimulant::Helper

  def assert_dom_equal_without_spaces(expected, actual)
    assert_dom_equal(expected.gsub(/\n\s*/, ""), actual)
  end

  def test_stimulus_scope
    res = stimulus_scope :slideshow do |s|
      tag.div data: { controller: s.controller } do
        tag.div data: { target: s.target(:slide) } do
          tag.button "next", data: { action: s.target(:next) }
        end
      end
    end
    assert_dom_equal_without_spaces(<<~DOM, res)
      <div data-controller="slideshow">
        <div data-target="slideshow.slide">
          <button data-action="slideshow.next">next</button>
        </div>
      </div>
    DOM
  end

  def test_unused_scope
    assert_raise Stimulant::UnusedScopeError do
      stimulus_scope :slideshow do
      end
    end
  end

  def test_stimulus_tag
    res = stimulus_tag(:slideshow, index: 1).div(data: { foo: 2 }) do |s|
      tag.div data: { target: s.target(:slide) } do
        tag.button "next", data: { action: s.target(:next) }
      end
    end
    assert_dom_equal_without_spacesF(<<~DOM, res)
      <div data-controller="slideshow" data-slideshow-index="1" data-foo="2">
        <div data-target="slideshow.slide">
          <button data-action="slideshow.next">next</button>
        </div>
      </div>
    DOM
  end
end
