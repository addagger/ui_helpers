module UiHelpers
  module OverlayHelpers
    def overlay(content, dialog_text = nil, &block)
      dialog_text ||= capture(&block)
      UiHelpers::DialogOver.new(:base => content, :text => dialog_text).html(:div)
    end
  end
end