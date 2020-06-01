def is_numeric?(s)
  !!Float(s) rescue false
end

class Interface
  def initialize(prompt="=>", mode=["index", "name"], selector)
    @prompt = prompt
    @mode = mode
    @selector = selector
    @quittingsymbols = ["q", "quit", "exit"]
  end
  def interactive
    quitting = false
    while not quitting
      input = get
      if input[0] == "#"
        input = input[1...]
        if @quittingsymbols.include? input
          quitting = true
        end
      end
    end
  end
  def get
    print @prompt
    return gets.strip
  end
  def loop(times=1)
    if times == 0
      return
    elsif times > 0
      times -= 1
      loop(times)
      display
      select(get)
    end
  end
  def display
    @selector.printer
  end
  def select(input)
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
end
