module Sendmark
  class Markdown
    def initialize(css_parser)
      render = Sendmark::Render.new(css_parser: css_parser)
      @markdown = Redcarpet::Markdown.new(render)
    end

    def render(text)
      @markdown.render(text)
    end
  end
end
