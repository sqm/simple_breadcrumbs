# HasBreadcrumb

This gem extends models in Rails to provide a `breadcrumb_parent` and
`breadcrumb_name` method to any model. It also provides a view method,
`breadcrumb()`, which shows the links to the page and its parents in a
breadcrumb format.

## Installation

Add this line to your application's Gemfile:

    gem 'has_breadcrumb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_breadcrumb

## Usage

In your model:

    class User < ActiveRecord::Base
      has_breadcrumb :title => :username
    end

If you would like to display a model as a child of another model, you
can state that using the `:parent` option:

    class UserProfile < ActiveRecord::Base
      has_breadcrumb :parent => :user, :title => "Profile"
    end

As can be seen here, `has_breadcrumb` can accept a `String` on the
`:title` option, which is useful in the case where there is no field in
the model which would be suitable. The `:parent` option however, must
take a `Symbol`.

In addition to giving models breadcrumb object, breadcrumb links can be
displayed in a view. For example in an erb view for creating a new user,

    <h2 class="subtitle"><%= breadcrumb @user, 'New' %></h2>

will provide a link which includes the Index page and the controller
action to which this page is related.

Other options allowed by the `breadcrumb` method include
`:forced_parent`, which links to a non-natural parent of the current
view page.

By default, `breadcrumb` includes a link to the index of an object when only
one level exists.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
