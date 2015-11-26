[![Code Climate](https://codeclimate.com/github/gavinlaking/vedeu_cli.png)](https://codeclimate.com/github/gavinlaking/vedeu_cli)
[![Build Status](https://travis-ci.org/gavinlaking/vedeu_cli.svg?branch=master)](https://travis-ci.org/gavinlaking/vedeu_cli)

# Vedeu CLI

Vedeu (vee-dee-you; aka VDU) is my attempt at creating a terminal based
 application framework without the need for Ncurses. Please see
 [Vedeu](https://github.com/gavinlaking/vedeu). Vedeu CLI is a plugin for
 Vedeu which provides the means to generate client application code suitable
 for Vedeu.


## Requirements

Patience.


## Installation

To install Vedeu, simply:

    gem install vedeu

To use Vedeu's application scaffolding, see the
[RubyDoc](http://www.rubydoc.info/gems/vedeu/file/docs/getting_started.md)


## Example

Coming soon!


## Documentation & Usage

More coming soon! In the meantime...

To create a new application framework use:

    vedeu new your_app_name_here


To create a new view with supporting files within your newly created
 application, after moving into your application directory, use:

    mv your_app_name_here
    vedeu view your_view_name_here


To find out what version of Vedeu::CLI (and Vedeu) you are using, use:

    vedeu version


## Development / Contributing

* Documentation hosted at [RubyDoc](http://rubydoc.info/gems/vedeu_cli).
* Source hosted at [GitHub](https://github.com/gavinlaking/vedeu_cli).

Pull requests are very welcome! Please try to follow these simple rules if
 applicable:

* Please create a topic branch for every separate change you make.
* Make sure your patches are well tested.
* Update the [Yard](http://yardoc.org/) documentation.
  (Use `yard stats --list-undoc` to locate undocumented code)
* Update the [README](https://github.com/gavinlaking/vedeu_cli/blob/master/README.md).
* Please **do not change** the version number.

Any branch on the repository that is not `master` is probably experimental; do
 not rely on anything in these branches. Typically, `twerks` will be merged
 into `master` before a release, and branches prefixed with `spike/` are me
 playing with ideas.


### General contribution help

1. Fork it ([https://github.com/gavinlaking/vedeu_cli/fork](https://github.com/gavinlaking/vedeu_cli/fork))
2. Clone it
3. Run `bundle`
4. Run `rake` (runs all tests and coverage report) or `bundle exec guard`
5. Create your feature branch (`git checkout -b my-new-feature`)
6. Write some tests, write some code, **have some fun!**
7. Commit your changes (`git commit -am 'Add some feature'`)
8. Push to the branch (`git push origin my-new-feature`)
9. Create a new pull request.


## Author & Contributors

### Author

[Gavin Laking](https://github.com/gavinlaking)
 ([@gavinlaking](http://twitter.com/gavinlaking))

### Contributors

[https://github.com/gavinlaking/vedeu_cli/graphs/contributors](https://github.com/gavinlaking/vedeu_cli/graphs/contributors)

