require "yaml"

yaml_file = YAML.load_file('db/objects.yml')

points = []
# puts yaml_file
yaml_file.each do |x|
  attr = {}
  attr["name"] = x["name"]
  attr["latitude"] =  x["latitude"]
  attr["longitude"] =  x["longitude"]
  unless x["address"].nil?
    a = x["address"].split(",")
    a.delete_at(4)
    attr["address"] = a.join
    points << attr
  end
end
#
puts points
YAML.dump(points, File.open('db/final_format.yml', 'w'))

# p points
# p points[0][:name]
