require "ui_helpers/version"

module UiHelpers
  def self.load!
    require 'ui_helpers/elements'
    require 'ui_helpers/engine'
    require 'ui_helpers/railtie'
  end

end

UiHelpers.load!