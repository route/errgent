# About

Errgent lets you generate static pages for Rails applications using layout,
haml, sprockets, url helpers or the other related stuff you use in your
application. Out of the box rails has default error pages, but it's hard to
maintain them because if you did a little change in one, you have to fix the
others. It's easier to have one layout, make a change and regenerate all pages
in one rake task.

## Usage

I'm pretty sure your error pages shouldn't be heavy and they don't need all the
stuff inside `application.html.{erb,haml}`, so create
`error_page.html.{erb,haml}` layout. And then run `rake errgent`
