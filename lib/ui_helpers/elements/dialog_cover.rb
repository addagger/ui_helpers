module UiHelpers
  
  class DialogOver < Element    
    attr_accessor :base, :text, :width, :height, :top, :left

    after_init do
      html_options[:style] << "position: relative; padding:1% 2%; overflow:hidden;"
    end

    def width; @width||280; end
    def height; @height||130; end
    def top; @top||30; end
    def left; @left||50; end

    def shadow_options
      {:state => false, :width => width+22, :height => height+22, :top => top, :left => left}
    end

    def widget_content_options
      {:state => false, :width => width, :height => height, :top => top, :left => left}
    end

    def html(tag_name, &block)
      tag(tag_name) do |buffer|
        buffer << base
        buffer << Overlay.new(@template).tag(:div)
        buffer << Shadow.new(@template, shadow_options).tag(:div)
        buffer << WidgetContent.new(@template, widget_content_options).tag(:div) do |widget_content|
          widget_content << DialogContent.new(@template).tag(:div, text)
        end
      end
    end

  end
  
end