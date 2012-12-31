module UiHelpers
  
  class Overlay < Element
    after_init do      
      classes.commit("ui-widget-overlay")
    end
  end
  
end