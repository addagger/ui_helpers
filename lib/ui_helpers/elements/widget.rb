module UiHelpers
  
  class Widget < Element
    attr_accessor :corner, :state

    after_init do
      classes.commit("ui-widget", "ui-corner" => corner, "ui-state" => state)
    end

    def corner
      case @corner
      when false then nil
      when nil then "all"
      else @corner
      end
    end

    def state
      case @state
      when false then nil
      when nil then "default"
      else @state
      end
    end

  end
  
end