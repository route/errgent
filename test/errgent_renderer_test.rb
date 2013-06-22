require 'test_helper'

class ErrgentRendererTest < MiniTest::Unit::TestCase
  include ActiveSupport::Testing::Isolation

  def setup
    app.initialize!
    @renderer = Errgent::Renderer.new
    @renderer.action_view.lookup_context.view_paths = VIEW_PATH
  end

  def test_renders_given_layout
    filename = File.join(TMP_PATH, 'given_layout.html')

    @renderer.render('layouts/given_layout', filename)

    assert File.exists?(filename)
    assert_equal 'Hi, Dmitry!', File.read(filename)
  end

  def test_assigns_vars
    filename = File.join(TMP_PATH, 'assigns_vars.html')

    @renderer.render('layouts/assigns_vars', filename, { object: 'you' })

    assert File.exists?(filename)
    assert_equal 'you', File.read(filename)
  end

  def test_url_helpers
    filename = File.join(TMP_PATH, 'url_helpers.html')

    @renderer.render('layouts/url_helpers', filename)

    assert File.exists?(filename)
    assert_equal '/', File.read(filename)
  end

  def test_app_helpers
    filename = File.join(TMP_PATH, 'app_helpers.html')

    @renderer.render('layouts/app_helpers', filename)

    assert File.exists?(filename)
    assert_equal 'hi_there!', File.read(filename)
  end

  def test_partials
    filename = File.join(TMP_PATH, 'partials.html')

    @renderer.render('layouts/partials', filename)

    assert File.exists?(filename)
    assert_equal 'First', File.read(filename)
  end
end
