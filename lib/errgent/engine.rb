module Errgent
  class Engine < ::Rails::Engine
    rake_tasks do
      load 'errgent/task.rb'
    end
  end
end
