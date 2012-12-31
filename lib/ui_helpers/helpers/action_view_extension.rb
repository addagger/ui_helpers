require "ui_helpers/helpers/button"
require "ui_helpers/helpers/flash"
require "ui_helpers/helpers/link"
require "ui_helpers/helpers/overlay"

module UiHelpers
  module ActionViewExtension
    extend ActiveSupport::Concern
    
    include ButtonHelpers
    include FlashHelpers
    include LinkHelpers
    include OverlayHelpers
    
  end
  
end