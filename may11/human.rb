class Human
  def initialize (name)
      @name = name
      @alertness = 0
      @coffee_amount = 0
      @coffee = Coffee.new(coffee_type)
  end

  def has_coffee?
    if @coffee_amount == 0
      false
    else
      true
    end
  end

  def coffee
    @coffee
  end
  
  def needs_coffee?
    !self.has_coffee?
    #@alertness_level < 0.23 && !has_coffee
  end

  def buy (coffee)
    @coffee = coffee
  end

  def alertness
    @alertness
  end

  def drink!
    x=0
    while x <= @tsmf
      x = x += 1
      @alertness_level = 0.05 * x
    end
  end

end
