require "kakasi"
require "yaml"

yaml_file = YAML.load_file('db/parse_tokyo_shelter.yaml')

points = []

yaml_file["東京都"]["世田谷区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["千代田区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["台東区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["品川区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["渋谷区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["港区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

yaml_file["東京都"]["目黒区"].each_value do |x|
  attr = {}
  attr["name"] = x["name"].first
  attr["name_roma"] = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka -s', x["name"].first).upcase
  attr["latitude"] =  x["latlng"].split(",")[0]
  attr["longitude"] =  x["latlng"].split(",")[1]
  # p attr
  points << attr
end

YAML.dump(points, File.open('db/converted.yml', 'w'))

# p points
# p points[0][:name]
