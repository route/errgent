require 'errgent/task'

module Errgent
  class Engine < ::Rails::Engine
    rake_tasks do
      Rake::ErrgentTask.new
    end
  end
end
