module UiHelpers
  
  class LinkIcon < Icon
    attr_accessor :valign
        
    after_init do
      html_options[:style] << "display: inline-block; vertical-align: #{valign};"
    end
    
    def valign
      @valign||"middle"
    end
  end
  
end