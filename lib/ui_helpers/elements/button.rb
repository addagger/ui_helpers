module UiHelpers
  
  class Button < Widget
    attr_accessor :primary_icon, :secondary_icon, :text, :value, :title

    after_init do
      classes.commit("ui-button", "ui-button" => scope)
      html_options[:title] = title if title
      html_options[:value] = value if value
    end

    class Text < Element
      after_init do      
        classes.commit("ui-button-text")
      end
    end

    class OnlyIcon < Icon
      after_init do
        classes.commit("ui-button-icons-only")
      end
    end

    class PrimaryIcon < Icon
      after_init do
        classes.commit("ui-button-icon-primary")
      end
    end

    class SecondaryIcon < Icon
      after_init do
        classes.commit("ui-button-icon-secondary")
      end
    end

    def scope
      if text && any_icons?
        if primary_icon && secondary_icon        
          "text-icons" # text + primary_icon + secondary_icon
        elsif primary_icon
          "text-icon-primary" # text + primary_icon
        elsif secondary_icon
          "text-icon-secondary" # text + secondary_icon
        end
      elsif text
        "text-only" # text only
      elsif primary_icon && secondary_icon
        "icons-only" # primary_icon + secondary_icon
      elsif any_icons? 
        "icon-only" # just 1 icon
      end
    end

    def any_icons?
      primary_icon || secondary_icon
    end

    def content(&block)
      capture do |buffer|

        if scope == "icon-only"
          buffer << OnlyIcon.new(@template, :name => primary_icon).tag(:span)
        elsif scope.include?("icon") && primary_icon
          buffer << PrimaryIcon.new(@template, :name => primary_icon).tag(:span)
        end

        buffer << Text.new(@template).tag(:span, text||"&nbsp;", &block)

        if scope.include?("icon") && secondary_icon
          buffer << SecondaryIcon.new(@template, :name => secondary_icon).tag(:span)
        end

      end
    end

  end
  
end