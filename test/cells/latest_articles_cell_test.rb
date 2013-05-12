require 'test_helper'
#require_relative 'test_helper'


class LatestArticlesCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
