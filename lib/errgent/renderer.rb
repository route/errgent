class Errgent::Renderer
  def initialize(options = {})
    @vars = options[:vars] || {}
    @codes = options[:codes] || [403, 404, 422, 500]
    @layout = options[:layout] || 'layouts/error_page'
    @output = options[:output] || 'public/%s.html'
  end

  def render
    @codes.each do |code|
      File.open(Rails.root.join(@output % code), 'w') do |io|
        action_view.assign(@vars.merge(code: code))
        io.write action_view.render(template: @layout)
      end
    end
  end

  def helpers(&block)
    action_view.class_eval(&block)
  end

  private

  def action_view
    @action_view ||= begin
      paths = ::ActionController::Base.view_paths
      ::ActionView::Base.new(paths).tap do |view|
        view.class_eval do
          include Rails.application.helpers
          include Rails.application.routes.url_helpers
        end
      end
    end
  end
end
