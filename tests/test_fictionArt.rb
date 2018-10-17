require './lib/fictionArt.rb'
require 'test/unit'

class FictionArtTest < Test::Unit::TestCase

  def test_iron_man
    check = FictionArt.new("ironman")
    assert_equal(true, check.status)
  end

  def test_thor
    check = FictionArt.new("thor")
    assert_equal(true, check.status)
  end

  def test_phineas
    check = FictionArt.new("phineas")
    assert_equal(true, check.status)
  end

  def test_bugs_bunny
    check = FictionArt.new("bugsbunny")
    assert_equal(true, check.status)
  end
end
