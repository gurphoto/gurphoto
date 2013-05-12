require 'test/test_helper'
#require_relative 'test_helper'

require File.join(File.dirname(__FILE__), '..', 'test_helper.rb')

class LastReviewsCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
