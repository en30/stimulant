# Stimulant

Helper to integrate Stimulus into Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stimulant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stimulant

## Usage
### Helper Methods
stimulant adds two helper methods `stimulus_scope` and `stimulus_tag`.

#### 1. stimulus_scope(controller, **data)
```erbruby
<%= stimulus_scope :slideshow do |s| %>
  <div data-controller="<%= s.controller %>" data-action="<%= s.action(:next, on: "slideshow:next", at: "window)>
    <div data-target="<%= s.target(:slide) %>">
      <button data-action="<%= s.action(:next) + s.action(:hoge) %>">next</button>
    </div>
  </div>
<% end %>
```

becomes

```html
<div data-controller="slidedhow" data-action="slidedhow:next@window->slideshow#next">
  <div data-target="slideshow.slide">
    <button data-action="slidedhow#next slideshow#hoge">next</button>
  </div>
</div>
```

#### 2. stimulus_tag(controller, **data)
```erbruby
<%= stimulus_tag(:slideshow).div do |s| %>
  <div data-target="<%= s.target(:slide) %>">
    <button data-action="<%= s.action(:next) + s.action(:hoge) %>">next</button>
  </div>
<% end %>
```

becomes

```html
<div data-controller="slidedhow" data-action="slidedhow:next@window->slideshow#next">
  <div data-target="slideshow.slide">
    <button data-action="slidedhow#next slideshow#hoge">next</button>
  </div>
</div>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/en30/stimulant. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stimulant project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/stimulant/blob/master/CODE_OF_CONDUCT.md).
