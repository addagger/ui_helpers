module UiHelpers
  module FlashHelpers
    
    def ui_error(content = nil, &block)
      content ||= capture(&block)
      UiHelpers::Flash.new(:state => "error", :style => "padding: 0 .7em;", :icon => {:name => "alert", :style => "float: left; margin-right: .3em;"}).html(:div) do |buffer|
        buffer << content
      end
    end
    
    def ui_highlight(content = nil, &block)
      content ||= capture(&block)
      UiHelpers::Flash.new(:state => "highlight", :style => "padding: 0 .7em;", :icon => {:name => "info", :style => "float: left; margin-right: .3em;"}).html(:div) do |buffer|
        buffer << content
      end
    end
    
  end
end