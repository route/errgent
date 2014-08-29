require 'errgent/renderer'

class Errgent::Engine < ::Rails::Engine
  rake_tasks { load 'tasks/errgent.rake' }
end
