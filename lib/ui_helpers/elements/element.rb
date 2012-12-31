module UiHelpers
  
  class Element
    class Classes < Array
      def commit(*args)
        args.each do |arg|
          case arg
          when Hash then arg.each { |key, value| self << [key, value].compact.join("-") unless value.nil? }
          else self << arg
          end 
        end
      end

      def to_s
        join(" ")
      end
    end
  
     extend ActiveModel::Callbacks
  
    define_model_callbacks :init, :only => :after
  
    attr_reader :html_options
  
    def initialize(*args)
      params = args.extract_options!
      @template = args.first||ActionView::Base.new(Rails.configuration.paths["app/views"].first) ## fake      
      @html_options = Hash.new do |h,k|
        h[k] = case k
        when :class, "class" then Classes.new
        else []
        end
      end
      run_callbacks(:init) do      
        params.each do |key, value|
          send("#{key}=", value)
        end
      end
    end
  
    def style=(*value)
      @html_options[:style] << value
    end
  
    def classes=(*values)
      classes.commit(*values)
    end
  
    def classes
      @html_options[:class]
    end
  
    def capture(content = nil, &block)
      ActiveSupport::SafeBuffer.new(content||"").tap do |buffer|
        yield buffer if block_given?
      end
    end
  
    def tag(tag_name, content = nil, &block)
      @template.content_tag tag_name, capture(content, &block), @html_options
    end
  
    def with_html_options(hash = {})
      self.tap do |element|
        element.html_options.merge!(hash)
      end
    end
    
  end
  
end