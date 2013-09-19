# Vidibus::ValidateUri [![Build Status](https://travis-ci.org/vidibus/vidibus-validate_uri.png)](https://travis-ci.org/vidibus/vidibus-validate_uri)

It provides validation of URIs (URLs) to ActiveModel records and ActionControllers in Rails 3 and 4.

This gem is part of [Vidibus](http://vidibus.org), an open source toolset for building distributed (video) applications.

## Installation

Add `gem "vidibus-validate_uri"` to your Gemfile. Then call `bundle install` on your console.


## Usage

To validate an URI in your ActiveModel record, simply add the uri validator to the field you want to validate as URI:

```ruby
class Model
  include Mongoid::Document
  field :some_uri
  validates :some_uri, :uri => true
end
```

To validate an URI in any model, include ActiveModel::Validations:

```ruby
class Model
  include ActiveModel::Validations
  attr_accessor :uri
  validates :some_uri, :uri => true
end
```

Just in case you'll need it, a method `valid_uri?` is available to controllers that inherit from ActionController::Base. Use it like this:

```ruby
valid_uri?("something") # => false
```

### Validation options

To restrict validation to a certain protocol, provide a `:protocol` option:

```ruby
validates :some_uri, :uri => {:protocol => :rtmp}
validates :some_uri, :uri => {:protocol => [:rtsp, :rtmp]}
```

To check if the uri is accessible over the network, provide an `:accessible` option:

```ruby
validates :some_uri, :uri => {:accessible => true}
```

Just like for any other ActiveModel validation, you may allow blank values by providing an `:allow_blank` option:

```ruby
validates :some_uri, :uri => {:allow_blank => true}
```

You may provide those validation options to the `valid_uri?` method as well:

```ruby
valid_uri?(your_uri, :accessible => true)
valid_uri?(your_uri, :protocol => :rtmp)
valid_uri?(your_uri, :protocol => [:rtsp, :rtmp])
```

## Copyright

&copy; 2010-2013 Andre Pankratz. See LICENSE for details.
