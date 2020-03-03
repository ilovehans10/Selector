class Selector
  attr_accessor :items, :selected
  def initialize(items, sort = false)
    @items = sort ? items.to_a.sort : items.to_a
    @length = @items.length
    @selected = Array.new(@length, false)
  end
  def select(item)
    if @items.include?(item)
      @selected[@items.index(item)] = true
      return true
    end
    return false
  end
  def selecti(index)
    if index.between?(0, @items.length)
      @selected[index] = true
      return true
    end
    return false
  end
  def toggle(item)
    if @items.include?(item)
      @selected[@items.index(item)] = !@selected[@items.index(item)]
      return true
    end
    return false
  end
  def togglei(index)
    if index.between?(0, @items.length)
      @selected[index] = !@selected[index]
      return true
    end
    return false
  end
  def printer
    (0 ... @items.length).each do |item|
      print @selected[item] ? "[X] " : "[ ] "
      puts @items[item]
    end
  end
  def invert
    selected.map!{ |index| index = !index}
  end
end

FishList = ["Haddock", "Cod", "Magic Heddock", "Bass", "Seaweed"]
Fish = Selector.new(FishList, sort = true)
Fish.items
Fish.select("Cod")
Fish.togglei(2)
Fish.printer
puts "----------"
Fish.invert
Fish.toggle("Bass")
Fish.printer
