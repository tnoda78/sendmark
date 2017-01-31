module Sendmark
  class CssParser < CssParser::Parser
    # define selector methods
    %i(body h1 h2 h3 h4 h5 h6 p ul li a span).each do |selector|
      define_method(selector) do
        self[selector.to_s][0]
      end
    end
  end
end
