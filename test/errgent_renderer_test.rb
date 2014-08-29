require 'test_helper'

class Errgent::RendererTest < ::MiniTest::Unit::TestCase
  include ::ActiveSupport::Testing::Isolation

  def test_renders_given_layout
    @layout = 'layouts/given_layout'
    @output = File.join(TMP_PATH, 'given_layout.html')

    renderer.render

    assert File.exists?(@output)
    assert_equal 'Hi, Dmitry!', File.read(@output)
  end

  def test_assigns_vars
    @vars = { object: 'you' }
    @layout = 'layouts/assigns_vars'
    @output = File.join(TMP_PATH, 'assigns_vars.html')

    renderer.render

    assert File.exists?(@output)
    assert_equal 'you', File.read(@output)
  end

  def test_url_helpers
    @layout = 'layouts/url_helpers'
    @output = File.join(TMP_PATH, 'url_helpers.html')

    renderer.render

    assert File.exists?(@output)
    assert_equal '/', File.read(@output)
  end

  def test_app_helpers
    @layout = 'layouts/app_helpers'
    @output = File.join(TMP_PATH, 'app_helpers.html')

    renderer.render

    assert File.exists?(@output)
    assert_equal 'hi_there!', File.read(@output)
  end

  def test_custom_helpers
    @layout = 'layouts/custom_helpers'
    @output = File.join(TMP_PATH, 'custom_helpers.html')

    renderer.helpers do
      def current_user
        'Dmitry'
      end

      def role
        'admin'
      end
    end

    renderer.render

    assert File.exists?(@output)
    assert_equal 'Dmitry = admin', File.read(@output)
  end

  def test_partials
    @layout = 'layouts/partials'
    @output = File.join(TMP_PATH, 'partials.html')

    renderer.render

    assert File.exists?(@output)
    assert_equal 'First', File.read(@output)
  end

  def test_a_few_error_pages
    @codes = [404, 500]
    @layout = 'layouts/a_few_error_pages'
    @output = File.join(TMP_PATH, '%s.html')

    renderer.render

    assert File.exists?(@output % 404)
    assert_equal '404', File.read(@output % 404)

    assert File.exists?(@output % 500)
    assert_equal '500', File.read(@output % 500)
  end

  private

  def renderer
    @renderer ||= begin
      options = { codes: @codes || [404], layout: @layout, output: @output, vars: @vars }
      Errgent::Renderer.new(options).tap do |renderer|
        renderer.send(:action_view).lookup_context.view_paths = VIEW_PATH
      end
    end
  end
end
