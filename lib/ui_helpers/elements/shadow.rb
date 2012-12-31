module UiHelpers
  
  class Shadow < Widget
    include Positionable
    after_init do      
      classes.commit("ui-widget-shadow")
    end
  end
  
end