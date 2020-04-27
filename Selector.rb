# Allows case to use include
def ===(value)
  include?(value)
end

def is_numeric?(s)
  !!Float(s) rescue false
end

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
  def deselect(item)
    if @items.include?(item)
      @selected[@items.index(item)] = false
      return true
    end
    return false
  end
  def deselecti(index)
    if index.between?(0, @items.length)
      @selected[index] = false
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
    puts
  end
  def invert
    selected.map!{ |index| index = !index}
  end
  def getselected
    list = []
    (0 ... @items.length).each do |item|
      @selected[item] ? list.append(@items[item]) : ""
    end
    return list
  end
  def getselectedi
    list = []
    (0 ... @items.length).each do |item|
      @selected[item] ? list.append(item) : ""
    end
    return list
  end
  def getunselected
    list = []
    (0 ... @items.length).each do |item|
      @selected[item] ? "" : list.append(@items[item])
    end
    return list
  end
  def getunselectedi
    list = []
    (0 ... @items.length).each do |item|
      @selected[item] ? "" : list.append(item)
    end
    return list
  end
end

class Interface
  def initialize(prompt="=>", mode=["index", "name"], selector)
    @prompt = prompt
    @mode = mode
    @selector = selector
  end
  def display
    @selector.printer
  end
  def get
    print @prompt
    input = gets.strip
    if @mode.include?("index") and is_numeric?(input)
      @selector.togglei(input.to_i)
      return true
    end
    if @mode.include?("name")
      @selector.toggle(input)
      return true
    end
    return false
  end
  def loop(times=1)
    if times == 0
      return
    elsif times > 0
      times -= 1
      loop(times)
      display
      get
    end
  end
end

FishList = ["Haddock", "Cod", "Magic Heddock", "Bass", "Seaweed"]
Fish = Selector.new(FishList, sort = true)
Fish.select("Cod")
Fish.togglei(2)
Fish.printer
Fish.invert
Fish.deselect("Bass")
Fish.printer
FishInterface = Interface.new(prompt="=>", mode=["index", "name"], Fish)
FishInterface.loop(3)
FishInterface.display
