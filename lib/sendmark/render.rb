module Sendmark
  class Render < Redcarpet::Render::HTML
    def initialize(extentions)
      @css_parser = extentions[:css_parser] unless extentions[:css_parser].nil?
      super
    end

    def header(text, header_level)
      tag = "h#{header_level}"
      if css_defined_with?(tag)
        "<#{tag} style=\"#{css_style(tag)}\">#{text}</#{tag}>"
      else
        "<#{tag}>#{text}</#{tag}>"
      end
    end

    def list_item(text, list_type)
      if css_defined_with?("li")
        "<li style=\"#{css_style("li")}\">#{text}</li>"
      else
        "<li>#{text}</li>"
      end
    end

    def paragraph(text)
      if css_defined_with?("p")
        "<p style=\"#{css_style("p")}\">#{text}</p>"
      else
        "<p>#{text}</p>"
      end
    end

    def link(link, title, content)
      if css_defined_with?("a")
        "<a style=\"#{css_style("a")}\" href=\"#{link}\">#{content}</a>"
      else
        "<a href=\"#{link}\">#{content}</a>"
      end
    end

    private
    def css_style(selector)
      @css_parser.send(selector)
    end

    def css_defined_with?(selector)
      return false if @css_parser.nil? || @css_parser.send(selector).nil?
      true
    end
  end
end
