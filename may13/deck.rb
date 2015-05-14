module IronYardGames

  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:diamonds, :clubs, :spades, :hearts]

  RANK_VALUES = {J: 11, Q: 12, K: 13, A: 14}


class Card



  attr_accessor :rank, :suit
  include Comparable
  include Enumerable
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

 class Deck

   include Enumerable

  def initialize
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end
    def shuf
      @cards.shuffle!
    end

    def peek
      @cards[0]
    end

    def count
      @cards.count
    end

    def hand(x)
      @cards.take(x)
      @cards.shift(x)     
    end
    
 end
end




# end
