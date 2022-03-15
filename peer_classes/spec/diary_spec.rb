require "diary"

RSpec.describe Diary do
  it "is initialized with a string of contents" do
    diary = Diary.new("My diary entry")
    expect(diary.read).to eq("My diary entry")
  end
end
