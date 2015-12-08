require 'minitest/autorun'
require 'minitest/emoji'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_the_class_works
    assert JungleBeat.new("sound")
  end

  def test_a_single_node_has_no_link
    jb = JungleBeat.new("sound")
    refute jb.link?
  end

  def test_the_initial_node_is_head
    # skip
    jb = JungleBeat.new("sound")
    assert jb.head
  end

  def test_data_in_single_node_is_sound_passed_in
    jb = JungleBeat.new("sound")
    assert_equal "sound", jb.data
  end

  def test_it_will_play_a_single_sound
    jb = JungleBeat.new("pizza")
    assert_equal 1, jb.play
  end

end
