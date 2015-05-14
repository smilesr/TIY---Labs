require 'pry'

module IronYardGames
  include Enumerable
  class Card

  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:diamonds, :clubs, :spades, :hearts]

  RANK_VALUES = {J: 11, Q: 12, K: 13, A: 14}

  attr_accessor :rank, :suit
  include Comparable

  def initialize(rank=nil, suit=nil)
    @rank = rank || RANKS.sample
    @suit = suit || SUITS.sample
  end

  def value
    val = RANK_VALUES[self.rank]
    val ||= self.rank
  end

  def <=>(other)
    self.value <=> other.value
  end
  end
end

class Deck

  attr_read :peek, :shuffle, :draw

  def initialize (draw)
    @draw = draw
    @peek = peek
    @shuffle = shuffle
    @card = Card.new(,)
    @rank = Card.new()
    @suit = Card.new()
    #@et_card = Card.new

  end

  def deck_of_cards
    @suits.each do |y|
      @ranks.size.times do |x|
        @deck_of_cards << card(ranks[x], suit)RANKrank.length @ ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  end
end
  def @draw
      x= number.times do |variable|
      binding.pry
      #@deplete_deck(x)
      x = @get_card
      #@deplete_deck(x)
      @draw.push
    end

  #def @deplete_deck(x)
  #  @deplete_deck = @cards
  #end

  def @get_card
    @get_card = Card.new
  end

  def @peek
    @peek


# end
