class GrammarStats
  def initialize
    @trues = 0
    @totals = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "No string given" if !text.is_a?(String) || text.empty?

    result = ("A".."Z").include?(text[0]) && ([".", "?", "!"].include?(text[-1]))
    result ? (@trues += 1 ; @totals += 1) : @totals += 1
    result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    fail "Please check a text first" if @totals == 0

    (@trues / @totals.to_f * 100).round
  end
end