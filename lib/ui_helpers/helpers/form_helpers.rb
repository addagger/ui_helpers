module UiHelpers
  module FormHelpers
    
    def ui_submit(value=nil, options={})
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
      @template.ui_submit_tag(value, options)
    end
    
    def ui_button(value = nil, options = {}, &block)
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
      @template.ui_button_tag(value, options, &block)
    end
    
  end
end