require 'responsive_preview/middleware'

module ResponsivePreview
  class Railtie < Rails::Railtie
    initializer "responsive_preview.init" do |app|
      app.config.middleware.use ResponsivePreview::Middleware
    end
  end
end
