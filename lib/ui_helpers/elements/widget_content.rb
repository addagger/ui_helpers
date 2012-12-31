module UiHelpers
  
  class WidgetContent < Widget
    include Positionable
    after_init do
      classes.commit("ui-widget-content", :state => nil)
      html_options[:style] << "padding: 10px;"
    end
  end
  
end