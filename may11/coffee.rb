class Coffee
  def initialize(drink_type)
    @tsmf = drink_type
    if "Triple Shot Mocha Frappuccino" || "Caramel Frappuccino"
      @tsmf = 10.to_i # represents how many sips per cup
    end   
  end

  def full?
    @full
    #@tsmf ==10
  end

  def empty?
    @empty
#    @tsmf ==0
  end
end
