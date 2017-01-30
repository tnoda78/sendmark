module Sendmark
  class Mail
    attr_reader :css_parser

    # define_methods
    attributes = %i(to from subject multipart markdown css delivery_method delivery_settings)
    attributes.each do |method_name|
      define_method(method_name) do |value = nil|
        if value
          instance_variable_set("@#{method_name}", value)
        else
          instance_variable_get("@#{method_name}")
        end
      end

      define_method("#{method_name}=") do |value|
        instance_variable_set("@#{method_name}", value)
      end
    end

    def initialize(args = {}, &block)
      args.each do |k, v|
        setter = "#{k}="
        send(setter, v) if respond_to?(setter)
      end

      if block_given?
        instance_eval(&block)
      end

      unless css.nil?
        @css_parser = CssParser.new
        @css_parser.load_string! css
      end
    end

    def delivery_method(method, settings = {})
      @method = method
      @settings = settings
      self
    end

    def deliver
      delivery_mail = mail
      delivery_mail.delivery_method(@method, @settings)
      delivery_mail.deliver
    end

    def mail
      html = rendered_html
      mail = ::Mail.new(to: to, from: from, subject: subject)

      html_part = ::Mail::Part.new do
        content_type "text/html; charset=UTF-8"
        body html
      end

      mail.html_part = html_part
      mail
    end

    def rendered_html
      render = Markdown.new(@css_parser)
      text = @markdown.nil? ? "" : @markdown
      render.render(text)
    end
  end
end
