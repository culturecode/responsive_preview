# ResponsivePreview

Rack Middleware gem that injects an iframe around the response for the purpose of testing responsive css at different
breakpoints.

## Usage


Define when the responsive preview is shown

```ruby
class MyController < ApplicationController
  def wants_responsive_preview?
    # some condition to decide when to view the page in the responsive preview layout
  end
end
```

Provide a responsive preview layout

```ERB
<!-- app/views/layouts/responsive_preview.html.erb -->

<!-- Add some other chrome for switching devices/iframe dimensions -->
<%= content_tag :iframe, '', srcdoc: yield %>
<%= responsive_preview_js %>
```
