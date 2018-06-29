require './lib/fictionArt.rb'
require 'test/unit'

class FictionArtTest < Test::Unit::TestCase

  def test_iron_man
    check = FictionArt.new("iron_man")
    assert_equal(true, check.status)
  end

  def test_thor
    check = FictionArt.new("iron_man")
    assert_equal(true, check.status)
  end

  def test_phineas
    check = FictionArt.new("iron_man")
    assert_equal(true, check.status)
  end

end
