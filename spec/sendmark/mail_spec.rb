require "spec_helper"

describe Sendmark::Mail do
  let(:mail) { set_param_object }

  let(:params) do
    { to: ["to@example.com"], from: "from@example.com", multipart: true,
      subject: "subject", markdown: "# markdown", css: "h1 { color: #000; }" }
  end

  let(:set_param_object) do
    described_class.new(params)
  end

  let(:block_given_object) do
    described_class.new do
      to "to@example.com"
      from "from:example.com"
      subject "subject"
      markdown "# markdown"
      css "h1 { color: #000; }"
    end
  end

  describe ".new" do
    context "when set initialize method parameter" do
      subject do
        set_param_object
      end

      it "creates Sendmark::Mail object" do
        is_expected.to be_kind_of described_class
      end
    end

    context "when use block" do
      subject do
        block_given_object
      end

      it "creates Sendmark::Mail object" do
        is_expected.to be_kind_of described_class
      end
    end
  end

  describe "#to" do
    subject do
      mail.to
    end

    it { is_expected.to eq [ "to@example.com" ] }
  end

  describe "#from" do
    subject do
      mail.from
    end

    it { is_expected.to eq "from@example.com" }
  end

  describe "#multipart" do
    subject do
      mail.multipart
    end

    it { is_expected.to be_truthy }
  end

  describe "#subject" do
    subject do
      mail.subject
    end

    it { is_expected.to eq "subject" }
  end

  describe "#markdown" do
    subject do
      mail.markdown
    end

    it { is_expected.to eq "# markdown" }
  end

  describe "#css" do
    subject do
      mail.css
    end

    it { is_expected.to eq "h1 { color: #000; }" }
  end

  describe "#delivery_method" do
    subject do
      mail.delivery_method(:smtp, address: "localhost", port: 25)
    end

    it { is_expected.to be_kind_of Sendmark::Mail }
  end

  describe "#css_parser" do
    subject do
      mail.css_parser
    end

    context "when css parameter set" do
      it "returns Sendmark::CssParser object" do
        is_expected.to be_kind_of Sendmark::CssParser
      end
    end

    context "when css parameter == nil" do
      before do
        params.delete(:css)
      end

      it "returns nil" do
        is_expected.to be_nil
      end
    end
  end

  describe "#deliver" do
    subject do
      mail.delivery_method(:smtp, { address: "example.com", port: 1025 })
      mail.deliver
    end

    it "calls deliver method" do
      expect_any_instance_of(Mail::Message).to receive(:deliver).and_return(nil)
      subject
    end
  end
end
