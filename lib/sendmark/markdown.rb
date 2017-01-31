module Sendmark
  class Markdown
    def initialize(css_parser)
      @css_parser = css_parser
      render = Sendmark::Render.new(css_parser: @css_parser)
      @markdown = Redcarpet::Markdown.new(render)
    end

    def render(text)
      "#{body_start_tag}#{@markdown.render(text)}#{body_end_tag}"
    end

    def body_start_tag
      style = @css_parser.body

      unless style.nil?
        "<body style=\"#{style}\">"
      else
        "<body>"
      end
    end

    def body_end_tag
      "</body>"
    end
  end
end
