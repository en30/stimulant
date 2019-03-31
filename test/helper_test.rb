require "test_helper"
require "action_view"

class HelperTest < ActionView::TestCase
  tests Stimulant::Helper

  def test_stimulus_scope
    res = stimulus_scope :slideshow do |s|
      tag.div data: { controller: s.controller } do
        tag.div data: { target: s.target(:slide) } do
          tag.button "next", data: { action: s.target(:next) }
        end
      end
    end
    assert_dom_equal(
      %(<div data-controller="slideshow"><div data-target="slideshow.slide"><button data-action="slideshow.next">next</button></div></div>),
      res,
    )
  end

  def test_unused_scope
    assert_raise Stimulant::UnusedScopeError do
      stimulus_scope :slideshow do
      end
    end
  end
end
