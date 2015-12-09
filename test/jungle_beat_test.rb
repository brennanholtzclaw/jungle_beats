require 'minitest/autorun'
require 'minitest/emoji'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_the_class_works
    assert JungleBeat.new("beep")
  end

  def test_head_is_nil_with_empty_input
    skip
    jb = JungleBeat.new("")
    assert_equal nil, jb.all
  end

  def test_it_can_find_data_in_a_single_node
    skip
    jb = JungleBeat.new("beep")
    assert_equal "beep", jb.all
  end

  def test_it_can_find_data_in_multiple_nodes
    skip
    jb = JungleBeat.new("beep bop boop")
    assert_equal "beep bop boop", jb.all
  end

  def test_the_initial_node_is_head
    jb = JungleBeat.new("beep")
    assert jb.head
  end

  def test_it_will_play_a_single_beep
    # skip
    jb = JungleBeat.new("beep")
    assert_equal 1, jb.play
  end

  def test_you_can_pass_in_two_words
    jb = JungleBeat.new("beep bop")
    assert_equal 2, jb.count
  end

  def test_it_can_take_a_few_words
    # skip
    jb = JungleBeat.new("beep bop deep")
    assert_equal 3, jb.count
  end

  def test_how_long_count_takes_with_lots_of_words
    # skip
    jb = JungleBeat.new("shoop beep bop deep tok tick tack slip slap shut shoot swip")
    assert_equal 12, jb.count
  end

  def test_it_will_play_two_sounds
    # skip
    jb = JungleBeat.new("beep bop")
    assert_equal 2, jb.play
  end

  def test_it_will_play_several_sounds
    # skip
    jb = JungleBeat.new("beep bop a rockin doot dat")
    # binding.pry
    assert_equal 6, jb.play
  end

  def test_it_can_pop_a_single_element_list
    jb = JungleBeat.new("beep")
    assert_equal "beep", jb.pop
  end

  def test_it_can_pop_one_piece_from_a_double_element_list
    jb = JungleBeat.new("beep bop")
    assert_equal 2, jb.count
    assert_equal "bop", jb.pop
    assert_equal 1, jb.count
  end

  def test_it_includes_a_certain_beat
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    assert jb.includes?("bop")
    refute jb.includes?("blorp")
    assert_equal 5, jb.count
  end

  def test_it_can_append_a_single_beat
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.append("beat")
    assert_equal 6, jb.count
    assert jb.includes?("beat")
  end

  def test_it_can_prepend_a_single_beat
    # skip
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.prepend("bleet")
    assert_equal 6, jb.count
    assert jb.includes?("bleet")
  end

  def test_it_can_prepend_multiple_beats
    skip
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.prepend("bleet blap")
    binding.pry
    assert_equal 7, jb.count
    assert jb.includes?("blap")
  end

  def test_it_can_pop_multiple_beats
    skip
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    # binding.pry
    jb.pop(2)
    assert_equal 3, jb.count
    # binding.pry
    assert jb.includes?("beep")
    refute jb.includes?("bah")
  end

end
