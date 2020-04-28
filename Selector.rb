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
  def printer
    (0 ... @items.length).each do |item|
      print "#{item}: "
      print @selected[item] ? "[X] " : "[ ] "
      puts @items[item]
    end
    puts
  end
end
