module UiHelpers
  module ButtonHelpers
    def ui_button_tag(content_or_options = nil, options = nil, &block)
      if block_given? && content_or_options.is_a?(Hash)
        content, options = capture(&block), content_or_options
      else
        content, options = content_or_options, options
      end
      options ||= {}
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_options[:text] = content
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      button_tag(ui_button.content, options)
    end

    def ui_link_to(name = nil, options = nil, html_options = nil, &block)
      if block_given?
        content, path, options = capture(&block), name, options
      else
        content, path, options = name, options, html_options
      end
      options ||= {}
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_options[:text] = content
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      link_to(ui_button.content, path, options)
    end

    def ui_link_to_function(name, function, html_options={})
      content = name
      options = html_options
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_options[:text] = content
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      link_to_function(ui_button.content, function, options)
    end

    def ui_button_to(name = nil, options = nil, html_options = nil, &block)
      # no icon support for input elements
      if block_given?
        content, path, options = capture(&block), name, options
      else
        content, path, options = name, options, html_options
      end
      options ||= {}
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      button_to(content, path, options)
    end

    def ui_button_to_function(name, function=nil, html_options={})
      content = name
      options = html_options
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      button_to_function(content, function, options)
    end

    def ui_submit_tag(value = "Save changes", options = {})
      content = value
      options = options.stringify_keys

      ui_options = options.delete("ui")||{}
      ui_button = UiHelpers::Button.new(self, ui_options)

      options.merge!(ui_button.html_options)

      submit_tag(content, options)
    end
  end
  
  module FormHelpers
    # submit
  end
  
end