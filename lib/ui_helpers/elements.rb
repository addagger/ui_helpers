module UiHelpers

  module Positionable
    extend ActiveSupport::Concern
  
    included do
      attr_accessor :width, :height, :top, :left
    
      after_init do
        html_options[:style] << "position: absolute;"
        html_options[:style] << "width: #{width}px;" if width
        html_options[:style] << "height: #{height}px;" if height
        html_options[:style] << "top: #{top}px;" if top
        html_options[:style] << "left: #{left}px;" if left
      end
    end
  end

  require "ui_helpers/elements/element"
  require "ui_helpers/elements/widget"
  require "ui_helpers/elements/widget_content"
  require "ui_helpers/elements/icon"
  require "ui_helpers/elements/just_icon"
  require "ui_helpers/elements/dialog_content"
  require "ui_helpers/elements/dialog_cover"
  require "ui_helpers/elements/overlay"
  require "ui_helpers/elements/button"
  require "ui_helpers/elements/flash"
  require "ui_helpers/elements/shadow"

end