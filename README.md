# Sendmark

Send email by markdown text.

## Installation

```
gem install sendmark
```

## Usage

```
mail = Sendmark::Mail.new(
  to: ["to@example.com"],
  from: "from@example.com",
  subject: "subject",
  css: "h1 { color: #000000; }",
  markdown: "# H1"
)

mail.delivery_method(:smtp, address: "smtp@example.com", port: 25)
mail.deliver
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

