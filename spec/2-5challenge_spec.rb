require '2-5challenge'

RSpec.describe GrammarStats do
  it "when given a string with a capital letter and
  ends with a sentence-ending punctuation
  mark it returns true" do
    grammar_stats = GrammarStats.new
    result = grammar_stats.check("Hello, world.")
    expect(result).to eq true
  end

  it "starts uncapitalized, ends with '.', '?' or '!' punctuation" do
    grammar_stats = GrammarStats.new
    expect(grammar_stats.check("hello, world.")).to eq false
    expect(grammar_stats.check("hello, world?")).to eq false
    expect(grammar_stats.check("hello, world!")).to eq false
  end

  it "end without proper punctuation" do
    grammar_stats = GrammarStats.new
    expect(grammar_stats.check("hello, world")).to eq false
  end

  context "when no string is given" do
    it "fails" do
      grammar_stats = GrammarStats.new
      expect { grammar_stats.check("") }.to raise_error "No string given"
      expect { grammar_stats.check(1) }.to raise_error "No string given"
      expect { grammar_stats.check([]) }.to raise_error "No string given"
    end
  end

  it "one correct string is given, returns 100" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Hello, world.")
    expect(grammar_stats.percentage_good).to eq 100
  end

  it "one false string is given, returns 0" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("hello, world.")
    expect(grammar_stats.percentage_good).to eq 0
  end

  it "two correct and three false strings are given,
  returns 40" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Hello, world.")
    grammar_stats.check("We're having fun!")
    grammar_stats.check("hello, world.")
    grammar_stats.check("this is not good")
    grammar_stats.check("hello, world")
    expect(grammar_stats.percentage_good).to eq 40
  end

  it "one correct and two false strings are given,
  returns 33" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Hello, world.")
    grammar_stats.check("hello, world.")
    grammar_stats.check("this is not good")
    expect(grammar_stats.percentage_good).to eq 33
  end

  it "when percentage_good is run first" do
    grammar_stats = GrammarStats.new
    expect { grammar_stats.percentage_good }.to raise_error "Please check a text first"
  end
end