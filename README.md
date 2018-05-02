# Dijkstra

[![Build Status](https://travis-ci.org/franciscomxs/dijkstra.svg?branch=master)](https://travis-ci.org/franciscomxs/dijkstra)
[![Coverage Status](https://coveralls.io/repos/github/franciscomxs/dijkstra/badge.svg?branch=master)](https://coveralls.io/github/franciscomxs/dijkstra?branch=master)
[![Code Climate](https://codeclimate.com/github/franciscomxs/dijkstra/badges/gpa.svg)](https://codeclimate.com/github/franciscomxs/dijkstra)



Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dijkstra`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dijkstra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dijkstra

## Usage

```ruby
graph = [['A', 'B', 7],
['A', 'C', 9],
['A', 'F', 14],
['B', 'C', 10],
['B', 'D', 15],
['C', 'D', 11],
['C', 'F', 2],
['D', 'E', 6],
['E', 'F', 9]]

origin = 'A'

destination = 'E'

dijkstra = Dijkstra.algorithm(graph, origin, destination)

dijkstra.shortest_route
=> 'A - C - F - E'

dijkstra.shortest_distance
=> 20

# To get all steps:
dijkstra.shortest_path
=> [<Dijkstra::Path....]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dijkstra.
