require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  def setup
    @match = Result.new
  end

  test "match name exists" do
    assert @match.name
  end
end
