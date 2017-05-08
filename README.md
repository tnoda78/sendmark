# Sendmark

[![Gem Version](https://badge.fury.io/rb/sendmark.svg)](https://badge.fury.io/rb/sendmark)
[![Build Status](https://travis-ci.org/tnoda78/sendmark.svg?branch=master)](https://travis-ci.org/tnoda78/sendmark)
[![Coverage Status](https://coveralls.io/repos/github/tnoda78/sendmark/badge.svg)](https://coveralls.io/github/tnoda78/sendmark)

Send email by markdown text.

## Installation

```
gem install sendmark
```

## Usage

```
mail = Sendmark.new(
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

