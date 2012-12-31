module UiHelpers
  
  class DialogContent < Element
    after_init do
      classes.commit("ui-widget-content", "ui-dialog-content")
      html_options[:style] << "background: none; border: 0;"
    end
  end
  
end