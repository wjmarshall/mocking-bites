require "secret_diary"
require "diary"

RSpec.describe "integration" do
  it "is initialized with a diary" do
    diary = Diary.new("My diary entry")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "is returns diary contents if diary is unlocked" do
    diary = Diary.new("My diary entry")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq("My diary entry")
  end

  it "can be locked after contents have been read" do
    diary = Diary.new("My diary entry")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end