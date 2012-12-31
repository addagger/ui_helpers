module UiHelpers
  module LinkHelpers
    def link_with_icon_to(name = nil, options = nil, html_options = nil, &block)
      if block_given?
        content, path, options = capture(&block), name, options
      else
        content, path, options = name, options, html_options
      end
      options ||= {}
      options = options.stringify_keys

      options["style"] = [options["style"], "white-space: nowrap;"].compact.join(" ")

      icon = options.delete("icon")
      content = UiHelpers::LinkIcon.new(self, icon).tag(:span) + content

      link_to(content, path, options)
    end

    def link_with_icon_to_function(name, function, html_options={})
      content = name
      options = html_options
      options = options.stringify_keys

      options["style"] = [options["style"], "white-space: nowrap;"].compact.join(" ")

      icon = options.delete("icon")
      content = UiHelpers::LinkIcon.new(self, icon).tag(:span) + content

      link_to_function(content, function, options)    
    end
  end
end