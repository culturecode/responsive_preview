module ResponsivePreview
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, response = @app.call(env)
      action_controller = env['action_controller.instance']

      if action_controller&.wants_responsive_preview?
        action_view = action_controller.class.helpers.tap do |context|
          # Set the controller so helpers can use it
          context.controller = action_controller

          # Set the renderer so view paths match the original controller action
          context.view_renderer = action_controller.view_renderer
        end

        body = action_view.render(html: Array(response.body).join, layout: "/app/views/layouts/responsive_preview").to_s
        headers["Content-Length"] = body.length.to_s
        response = [body]
      end

      return [status, headers, response]
    end
  end
end
