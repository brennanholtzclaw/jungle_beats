require 'minitest/autorun'
require 'minitest/emoji'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_the_class_works
    assert JungleBeat.new("beep")
  end

  def test_head_is_nil_with_empty_input
    # skip
    jb = JungleBeat.new("")
    assert_equal nil, jb.all
  end

  def test_it_can_find_data_in_a_single_node
    # skip
    jb = JungleBeat.new("beep")
    assert_equal "beep", jb.all
  end

  def test_it_can_find_all_data_in_multiple_nodes
    # skip
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
    skip
    jb = JungleBeat.new("beep bop")
    assert_equal 2, jb.play
  end

  def test_it_will_play_several_sounds
    skip
    jb = JungleBeat.new("beep bop a rockin doot dat")
    assert_equal 6, jb.play
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

  def test_it_can_append_two_beats
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.append("BLIP BLAP")
    assert_equal 7, jb.count
    assert_equal "beep bop a loo bah BLIP BLAP", jb.all
  end

  def test_it_can_append_multiple_beats
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.append("BLIP BLAP BLORP")
    assert_equal 8, jb.count
    assert_equal "beep bop a loo bah BLIP BLAP BLORP", jb.all
  end

  def test_it_can_prepend_a_single_beat
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.prepend("bleet")
    assert_equal 6, jb.count
    assert jb.includes?("bleet")
    assert_equal "bleet beep bop a loo bah", jb.all
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

  def test_it_can_pop_multiple_beats
    skip
    jb = JungleBeat.new("beep bop a loo bah")
    assert_equal 5, jb.count
    jb.pop(2)
    # binding.pry
    assert_equal 3, jb.count
    assert jb.includes?("beep")
    refute jb.includes?("bah")
  end

  def test_find_can_return_a_single_element_in_a_single_element_list
    jb = JungleBeat.new("bop")
    assert_equal "bop", jb.find(0)
  end

  def test_find_can_return_the_last_element_in_a_double_list
    jb = JungleBeat.new("bop beep")
    assert_equal "beep", jb.find(1)
  end

  def test_find_can_return_the_last_element_in_a_longer_list
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "beep", jb.find(4)
  end

  def test_find_can_return_the_an_inner_element_in_a_longer_list
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "dobber", jb.find(2)
  end

  def test_find_can_return_multiple_elements_in_a_longer_list
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "dobber dow", jb.find(2, 2)
  end

  def test_insert_can_throw_a_single_element_into_an_arbitrary_index
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "bop tweet dobber BLIP dow beep", jb.insert(2, "BLIP")
  end

  def test_insert_can_throw_two_elements_into_the_last_index
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "bop tweet dobber dow beep BLIP BLAP", jb.insert(4, "BLIP BLAP")
  end

  def test_insert_can_throw_two_elements_into_an_arbitrary_index
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "bop tweet dobber dow BLIP BLAP beep", jb.insert(3, "BLIP BLAP")
  end

  def test_insert_can_throw_multiple_elements_into_an_arbitrary_index
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "bop tweet dobber dow BLIP BLAP BLOOP beep", jb.insert(3, "BLIP BLAP BLOOP")
  end

  def test_insert_can_throw_any_elements_after_the_head
    jb = JungleBeat.new("bop tweet dobber dow beep")
    assert_equal "bop BLIP BLAP tweet dobber dow beep", jb.insert(0, "BLIP BLAP")
  end


  def test_extension_change_and_reset_rate_and_voice
    jb = JungleBeat.new("bop tweet dobber dow beep")
    jb.play
    jb.rate = "100"
    jb.voice = "Alice"
    jb.play
    jb.reset_voice
    jb.reset_rate
    jb.play
  end

end
