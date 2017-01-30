require "spec_helper"

describe Sendmark::CssParser do
  let(:parser) do
    parser = Sendmark::CssParser.new
    parser.load_string!(css)
    parser
  end

  let(:not_h1) do
    "h2 { color: #111111; background-color: #ffffff; }"
  end

  let(:css) do
    <<-EOF
h1 {
  color: #111111;
  background-color: #111111;
}
h2 {
  color: #222222;
  background-color: #222222;
}
h3 {
  color: #333333;
  background-color: #333333;
}
h4 {
  color: #444444;
  background-color: #444444;
}
h5 {
  color: #555555;
  background-color: #555555;
}
h6 {
  color: #666666;
  background-color: #666666;
}
p {
  color: #00ff00;
}
ul {
  color: #0000ff;
}
li {
  color: #ff0000;
}
a {
  color: #00ffff;
}
span {
  color: #ff00ff;
}
    EOF
  end

  describe "h1" do
    subject do
      parser.h1
    end

    context "when defines h1 style" do
      it { is_expected.to eq "color: #111111; background-color: #111111;" }
    end

    context "when does not define h1 style" do
      let(:css) do
        not_h1
      end

      it { is_expected.to be_nil }
    end
  end

  describe "#h2" do
    it "returns h2 style" do
      expect(parser.h2).to eq  "color: #222222; background-color: #222222;"
    end
  end

  describe "#h3" do
    it "returns h3 style" do
      expect(parser.h3).to eq "color: #333333; background-color: #333333;"
    end
  end

  describe "#4" do
    it "returns h4 style" do
      expect(parser.h4).to eq "color: #444444; background-color: #444444;"
    end
  end

  describe "#h5" do
    it "returns h5 style" do
      expect(parser.h5).to eq "color: #555555; background-color: #555555;"
    end
  end

  describe "#6" do
    it "returns h6 style" do
      expect(parser.h6).to eq "color: #666666; background-color: #666666;"
    end
  end

  describe "#p" do
    it "returns p style" do
      expect(parser.p).to eq "color: #00ff00;"
    end
  end

  describe "#ul" do
    it "returns ul style" do
      expect(parser.ul).to eq "color: #0000ff;"
    end
  end

  describe "#li" do
    it "returns li style" do
      expect(parser.li).to eq "color: #ff0000;"
    end
  end

  describe "#a" do
    it "returns a style" do
      expect(parser.a).to eq "color: #00ffff;"
    end
  end

  describe "#span" do
    it "returns span style" do
      expect(parser.span).to eq "color: #ff00ff;"
    end
  end
end
