require "spec_helper"

describe Sendmark do
  it "has a version number" do
    expect(Sendmark::VERSION).not_to be nil
  end

  describe ".new" do
    subject do
      Sendmark.new
    end

    it "creates Sendmark::Mail object" do
      is_expected.to be_kind_of Sendmark::Mail
    end
  end
end
