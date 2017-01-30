require "spec_helper"

describe Sendmark::Markdown do
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
    EOF
  end

  let(:not_css) do
    ""
  end

  let(:markdown) do
    css_parser = Sendmark::CssParser.new
    css_parser.load_string!(css)
    described_class.new(css_parser)
  end

  describe "#render" do
    subject do
      markdown.render(text)
    end

    context "with h1 rendering" do
      let(:text) { "# heading1" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h1 style=\"color: #111111; background-color: #111111;\">heading1</h1>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h1>heading1</h1>"
        end
      end
    end

    context "with h2 rendering" do
      let(:text) { "## heading2" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h2 style=\"color: #222222; background-color: #222222;\">heading2</h2>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h2>heading2</h2>"
        end
      end
    end

    context "with h3 rendering" do
      let(:text) { "### heading3" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h3 style=\"color: #333333; background-color: #333333;\">heading3</h3>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h3>heading3</h3>"
        end
      end
    end

    context "with h4 rendering" do
      let(:text) { "#### heading4" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h4 style=\"color: #444444; background-color: #444444;\">heading4</h4>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h4>heading4</h4>"
        end
      end
    end

    context "with h5 rendering" do
      let(:text) { "##### heading5" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h5 style=\"color: #555555; background-color: #555555;\">heading5</h5>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h5>heading5</h5>"
        end
      end
    end

    context "with h6 rendering" do
      let(:text) { "###### heading6" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<h6 style=\"color: #666666; background-color: #666666;\">heading6</h6>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<h6>heading6</h6>"
        end
      end
    end

    context "with list rendering" do
      let(:text) { "- list1\n- list2" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<ul>\n<li style=\"color: #ff0000;\">list1\n</li><li style=\"color: #ff0000;\">list2\n</li></ul>\n"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<ul>\n<li>list1\n</li><li>list2\n</li></ul>\n"
        end
      end
    end

    context "with p rendering" do
      let(:text) { "This is markdown." }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<p style=\"color: #00ff00;\">This is markdown.</p>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<p>This is markdown.</p>"
        end
      end
    end

    context "with a rendering" do
      let(:text) { "[link](http://example.com)" }

      context "with css" do
        it "returns converted html" do
          is_expected.to eq "<p style=\"color: #00ff00;\"><a style=\"color: #00ffff;\" href=\"http://example.com\">link</a></p>"
        end
      end

      context "without css" do
        let(:css) { not_css }

        it "returns converted html" do
          is_expected.to eq "<p><a href=\"http://example.com\">link</a></p>"
        end
      end
    end
  end
end
