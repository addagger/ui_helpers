require 'rails'

module UiHelpers
  class Railtie < ::Rails::Railtie
    config.before_initialize do
      ActiveSupport.on_load :action_view do
        require 'ui_helpers/helpers/action_view_extension'
        include ActionViewExtension
        require 'ui_helpers/helpers/form_helpers'
        ActionView::Helpers::FormBuilder.send(:include, FormHelpers)
      end
    end

  end
end