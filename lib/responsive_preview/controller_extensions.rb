require 'digest'

module ResponsivePreview
  module ControllerExtensions
    module InstanceMethods
      def wants_responsive_preview?
        # Override this method in the host app controllers
        false
      end
    end
  end
end
