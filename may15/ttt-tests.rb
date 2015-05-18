require './ttt-board'
require './ttt-player'
require './tic-tac-toe-3'
require './end_of_the_game'

require 'minitest/autorun'

class TTTTest < MiniTest::Test
  GameTime = Game

  def test_create_player_types
    game = Game.new
    assert_instance_of player_types, player_types
  end
end

# does selection replace prior selection
# 