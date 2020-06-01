require_relative "Interface"
require_relative "Selector"

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
FishInterface.interactive
