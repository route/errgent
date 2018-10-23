# Errgent

Gently generate error pages using layout, your favorite markup language, basic
and url helpers or the other stuff you ever used in your templates. Out of the
box Rails has default error pages, but they're hardly maintained, because if you
do a little change in one, you'll have to fix the others. With `Errgent` you can
make changes and re-generate all pages at once.

## Installation

```ruby
gem 'errgent'
```

## Usage

`Errgent` ships with rake task that you can run locally or on your server using
`Capistrano`. In order to generate pages simply run `rake errgent`. By default
`layouts/error_page` is used as a layout. But you can customize this behaviour
as many other things creating your own task in `lib/tasks`. Make sure you didn't
name your task `errgent` as rake will run both tasks yours and original one making
your overrides not working. Name it as `generate_error_pages` for e.g.:

```ruby
desc 'Generate error pages'
task generate_error_pages: :environment do
  renderer = Errgent::Renderer.new(
    codes: [403, 404, 422, 500], # error codes by default, @code variable is available in layout
    vars: { name: 'value' }, # variable @name will be available in layout
    layout: 'layouts/error_page', # where to find your layout by default
    output: 'public/%s.html' # where to put generated pages by default, %s is the replacement for @code
  )

  # You can override or define new helpers:
  renderer.helpers do
    def current_user
      nil
    end

    def logged_in?
      false
    end
  end

  renderer.render
end
```

## Mina

```ruby

require 'errgent/mina'

task deploy: :environment do
  deploy do
    ...
    invoke :'errgent:generate'

```

## Capistrano

Since almost all applications use `Asset Pipeline`, the links to stylesheets,
js or images must be represented with digest in their names. It's barely possible
to do locally unless you generate assets locally either. That's why `Errgent`
ships with `Capistrano` task. Just put this to `deploy.rb` or `Capfile` (`~> 2.0`
and `~> 3.0` supported) and all the pages will be generated after
`assets:precompile` task on your server during deployment:

```ruby
require 'errgent/capistrano'
```

In other words for development, generate pages locally see how it looks, fix it
if it needs. Then re-generate them on the server, because development version
isn't workable in production.

## License

Errgent is released under the [MIT License](http://www.opensource.org/licenses/MIT).
