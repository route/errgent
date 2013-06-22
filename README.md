# Errgent

Generates error pages using layout, your favorite markup language, basic and url
helpers or the other stuff you ever used in your templates. Out of the box Rails
has default error pages, but they're hardly maintained because if you do a
little change in one, you'll have to fix the others. With errgent you can make
changes and regenerate all pages at once.

## Installation

    gem 'errgent'

## Usage

I'm pretty sure error pages should be lighter than application layout. Running
`rake errgent` will generate pages from `layouts/error_page` to public folder
with names as error codes(by default we generate `500.html`, `403.html`,
`404.html` and `422.html`). You can create and customize your own rake task:

    Rake::ErrgentTask.new do |t|
      t.codes = [500, 404]
      t.source = 'layouts/your_own'
      t.destination = 'public/error_%{code}.html'
    end

You can add generated pages to git index, and regenerate them on demand, or you
can add `require 'errgent/capistrano'` to `deploy.rb` and it will build pages on
server.

## License

Errgent is released under the [MIT License](http://www.opensource.org/licenses/MIT).
