def is_numeric?(s)
  !!Float(s) rescue false
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
