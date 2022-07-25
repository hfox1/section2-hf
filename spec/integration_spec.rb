require "music_library"
require "track"

# 2 - searches by keyword
# 3 - searches by substring too
# 4 - if no results, search yields empty list
# 5 - formats individual tracks

RSpec.describe "Music player integration" do
  it "adds all tracks" do 
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end

  it "searches by keyword" do 
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.search_by_title("title_1")).to eq [track_1]
  end

  it "searches by substring" do 
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.search_by_title("title")).to eq [track_1, track_2]
  end

  # 4 - if no results, search yields empty list
  it "gives an empty list if no match" do
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.search_by_title("hello")).to eq []  
  end

  it "formats individual tracks" do
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    expect(track_1.format).to eq "TITLE_1 by ARTIST_1"
  end 

  it "gives a fail message when no title or artist" do
    expect{ Track.new("", "artist_1")}.to raise_error "Please enter title and artist"
  end

end 
