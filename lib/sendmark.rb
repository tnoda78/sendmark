require "sendmark/version"

require "css_parser"
require "mail"
require "redcarpet"

require "sendmark/mail"
require "sendmark/css_parser"
require "sendmark/render"
require "sendmark/markdown"

module Sendmark
  class << self
    def new
      Sendmark::Mail.new
    end
  end
end
