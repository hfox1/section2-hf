require '2-6challenege'
# add 1 track 
# add 3 tracks 
# can see 1 track when added 
# can see multiple tracks 
# error for no arg
# error non-string
# 

RSpec.describe ListeningLog do
it "adds 1 track" do 
  expect( ListeningLog.new.add_track("track1") ).to eq ["track1"]
end

it "adds three tracks" do 
  list = ListeningLog.new
  list.add_track("track1")
  list.add_track("track2")
  expect(list.add_track("track3")).to eq ["track1", "track2", "track3"]
end

it "returns list of all tracks" do 
  list = ListeningLog.new
  list.add_track("track1")
  list.add_track("track2")
  list.add_track("track3")
  expect(list.see_tracks).to eq ["track1", "track2", "track3"]
end

# error for no arg
context "error for no arg" do 
  it "asks for an arg" do 
    expect{ ListeningLog.new.add_track() }.to raise_error ArgumentError
  end
end

context "fails for non-string input" do
it "prompts for string" do 
  expect{ ListeningLog.new.add_track(4) }.to raise_error "Please enter text"
end 
end

end