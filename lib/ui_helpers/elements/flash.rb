module UiHelpers
  
  class Flash < Widget
    attr_accessor :icon

    def html(tag_name, &block)
      tag(tag_name) do |buffer|
        buffer << Element.new(@template).tag(:p) do |paragraph|
          paragraph << Icon.new(@template, icon).tag(:span)
          yield paragraph if block_given?
        end
      end
    end
  end
  
end