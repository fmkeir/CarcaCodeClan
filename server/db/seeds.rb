require_relative('../models/tile')
require('pry')

Tile.delete_all()

tile1 = Tile.new({
  "side_0" => "grass",
  "side_1" => "grass",
  "side_2" => "grass",
  "side_3" => "castle",
  "centre" => "",
  "has_junction" => false,
  "has_shield" => true,
  "image_url" => ""
  })
tile1.save()
tile1.save()
tile1.save()
tile1.save()

binding.pry
nil
