require 'test_helper'

class ErrgentTaskTest < MiniTest::Unit::TestCase
  include ActiveSupport::Testing::Isolation

  def setup
    app.initialize!
  end

  def test_customize_settings
    task = Rake::ErrgentTask.new do |t|
      t.codes = 'codes'
      t.source = 'source'
      t.destination = 'destination'
    end

    assert_equal 'codes', task.codes
    assert_equal 'source', task.source
    assert_equal 'destination', task.destination
  end

  def test_generate_error_pages
    filename = File.join(TMP_PATH, 'error_page_%{code}.html')
    task = Rake::ErrgentTask.new do |t|
      t.codes = [500, 404]
      t.destination = filename
      t.renderer.action_view.lookup_context.view_paths = VIEW_PATH
    end

    task.send(:generate_error_pages)

    _500, _404 = filename % { :code => 500 }, filename % { :code => 404 }
    assert File.exists?(_500)
    assert_equal '500 error!', File.read(_500)
    assert File.exists?(_404)
    assert_equal '404 error!', File.read(_404)
  end
end
