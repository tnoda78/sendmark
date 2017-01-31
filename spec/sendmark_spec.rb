require "spec_helper"

describe Sendmark do
  it "has a version number" do
    expect(Sendmark::VERSION).not_to be nil
  end

  describe ".new" do
    subject do
      Sendmark.new(
        to: ["to@example.com"],
        from: "from@example.com",
        subject: "subject",
        css: "h1 { color: #000000; }",
        markdown: "# H1"
      )
    end

    it "creates Sendmark::Mail object" do
      is_expected.to be_kind_of Sendmark::Mail
    end
  end
end
