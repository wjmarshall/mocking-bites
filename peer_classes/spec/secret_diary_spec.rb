require "secret_diary"

RSpec.describe SecretDiary do
  it "is initialized with a diary" do
    diary = double(:diary, contents: "My diary entry")
    secret_diary = SecretDiary.new(diary)
    allow(diary).to receive(:read).and_return(diary.contents)
    expect { secret_diary.read }.to raise_error "Go away!"
  end

  it "is returns diary contents if diary is unlocked" do
    diary = double(:diary, contents: "My diary entry")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    allow(diary).to receive(:read).and_return(diary.contents)
    expect(secret_diary.read).to eq("My diary entry")
  end

  it "can be locked after contents have been read" do
    diary = double(:diary, contents: "My diary entry")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    allow(diary).to receive(:read).and_return(diary.contents)
    secret_diary.lock
    expect { secret_diary.read }.to raise_error "Go away!"
  end
end





