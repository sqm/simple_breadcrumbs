# HasBreadcrumb

This gem produces a series of links in a breadcrumb format.

## Installation

Add this line to your application's Gemfile:

    gem 'has_breadcrumb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_breadcrumb

## Usage

`has_breadcrumb` should be used within a model if you are using Rails.

Return a breadcrumb link series with a provided page name. (The `:title`
option can be passed either as a string or a symbol)

    has_breadcrumb :title => "Page Name"

`has_breadcrumb` will also accept the `:parent` option passed as a
symbol.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
