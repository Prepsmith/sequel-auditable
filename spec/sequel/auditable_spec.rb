require "spec_helper"

describe Sequel::Auditable do
  it "has a version number" do
    expect(Sequel::Auditable::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
