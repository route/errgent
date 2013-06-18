module Errgent
  class Renderer
    def action_view
      @action_view ||= begin
        paths = ActionController::Base.view_paths
        ActionView::Base.new(paths).tap do |view|
          view.class_eval do
            include Rails.application.helpers
            include Rails.application.routes.url_helpers
          end
        end
      end
    end

    def render(source, destination, assigns = {})
      destination = Rails.root.join(destination)
      File.open(destination, 'w') do |io|
        action_view.assign(assigns)
        io.write action_view.render(:template => source)
      end
    end
  end
end
