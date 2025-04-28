require 'rspec'
require 'json'

RSpec.describe "SerpApi Code Challenge" do

  before :all do
    file_path = File.expand_path("../output.json", __dir__)
    file_content = File.read(file_path)
    @output = JSON.parse(file_content, symbolize_names: true)
  end

  it "artworks" do
    expect(@output[:artworks]).to be_a(Array)
    expect(@output[:artworks]).to_not be_empty
  end

  it "artworks - name" do
    expect(@output[:artworks][0][:name]).to be_a(String)
    expect(@output[:artworks][0][:name]).to_not be_empty
  end

  it "artworks - extensions" do
    expect(@output[:artworks][0][:extensions]).to be_a(Array)
    expect(@output[:artworks][0][:extensions]).to_not be_empty
  end

  it "artworks - link" do
    expect(@output[:artworks][0][:link]).to be_a(String)
    expect(@output[:artworks][0][:link]).to_not be_empty
  end

  it "artworks - image" do
    expect(@output[:artworks][0][:image]).to be_a(String)
    expect(@output[:artworks][0][:image]).to_not be_empty
  end

end
