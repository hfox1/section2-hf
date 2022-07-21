require "3.1single-method.rb"

string = Array.new(200,"water").join(" ")
string2 = Array.new(100,"water").join(" ")
string3 = Array.new(500,"water").join(" ")


RSpec.describe "reading_time" do 

  it "outputs 0 mins for 0 words" do 
    result = reading_time("")
    expect(result).to eq "The reading time for this text is 0.0 minute(s)."
  end
    
  it "outputs one minute for 200 words" do
    result = reading_time(string)
    expect(result).to eq "The reading time for this text is 1.0 minute(s)." 
  end

  it "outputs 0.5 minute for 100 words" do
    result = reading_time(string2)
    expect(result).to eq "The reading time for this text is 0.5 minute(s)." 
  end
 
  it "outputs 2.5 minute for 500 words" do
    result = reading_time(string3)
    expect(result).to eq "The reading time for this text is 2.5 minute(s)." 
  end
  
end