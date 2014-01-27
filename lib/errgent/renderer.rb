module Errgent
  class Renderer
    def render(source, destination, assigns = {})
      destination = Rails.root.join(destination)
      File.open(destination, 'w') do |io|
        action_view.assign(assigns)
        io.write action_view.render(:template => source)
      end
    end

    def action_view
      @action_view ||= begin
        paths = ::ActionController::Base.view_paths
        helpers = ::ActionController::Base._helpers
        ActionView::Base.new(paths).tap do |view|
          view.class_eval do
            include helpers
            include Rails.application.helpers
            include Rails.application.routes.url_helpers
          end
          view.class_eval(&@helpers) if @helpers
        end
      end
    end

    def helpers(&block)
      @helpers = block
    end
  end
end
