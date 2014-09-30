require 'minitest/autorun'

require 'rails'
require 'action_view'
require 'action_controller'
require 'active_support/testing/isolation'

require 'errgent'

class ActiveSupport::TestCase
  VIEW_PATH = File.expand_path('../views', __FILE__)
  TMP_PATH = File.expand_path('../tmp', __FILE__)

  def app
    Class.new(Rails::Application).tap do |app|
      app.configure do
        config.active_support.deprecation = :notify
        config.secret_token = 'a966a729a228e5d3edf00997e7b7eab7'
        config.eager_load = false

        routes {
          root to: 'home#index'
        }

        helpers_module = Module.new do
          def hi_there
            'hi_there!'
          end
        end

        helpers.send(:include, helpers_module)
      end
    end
  end

  def setup
    app.initialize!
  end

  def teardown
    Dir[File.join(TMP_PATH, '*')].each { |f| File.delete(f) }
  end
end