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
        original_response = Array(response.body).join
        body = action_controller.render_to_string(html: original_response, layout: "/app/views/layouts/responsive_preview")
        headers["Content-Length"] = body.length.to_s
        response = [body]
      end

      return [status, headers, response]
    end
  end
end
