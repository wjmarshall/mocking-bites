require "cat_facts"

RSpec.describe CatFacts do
  it "returns a cat fact" do
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get).with(URI("https://catfact.ninja/fact"))
    .and_return('{
      "fact": "The longest living cat on record according to the Guinness Book belongs to the late Creme Puff of Austin, Texas who lived to the ripe old age of 38 years and 3 days!",
      "length": 165
      }')
    cat_fact = CatFacts.new(requester_dbl)
    expect(cat_fact.provide).to eq "Cat fact: The longest living cat on record according to the Guinness Book belongs to the late Creme Puff of Austin, Texas who lived to the ripe old age of 38 years and 3 days!"
  end
end