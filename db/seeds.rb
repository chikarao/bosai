# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
puts 'seed start!'


[
  "Meguro Citizens Walking Group",
  "Funny Accents Association, Meguro Riverside",
  "Seirinkan Pizza Lovers Unite",
  "Tennis Players Meguro United",
  "Naka Meguro Craft Beer Lovers",
  "Association of Hen-na Gaijin of Meguro ku"
].each do |name|
  puts Organization.find_or_create_by!(name: name)
end


## From Here: Evacuation_points_load by Kouhei
yml_file = YAML.load_file('db/final_format.yml')
  ## Original Data: https://github.com/yutakikuchi/Data/tree/master/shelter/pref
  ## I convered and reduced data to reduce processing time manually
  ## And I used kakasi lib to get ro-ma ji name
  ## To avoid API request to Google every time, I once run creation to get address from Google API, after that, saved the result in objects.yml
  ## After that I reformated the file to make the last seed file simple.

yml_file.each do |x|
  eva = EvacuationPoint.new(name: x["name"], latitude: x["latitude"], longitude: x["longitude"], address: x["address"] )
  eva.number_of_evacuees = rand(10..100)
  eva.max_evacuees = rand(100..1000)
  eva.save(validate: false) # avoid requesting Google API every time
end
### To Here: Evacuation_points_load by Kouhei

#Impact Hub Tokyo latitude, longitude35.6339419,139.7059374


[
  {first_name: "Takashi", last_name: "Tamura", email: 'takashi@tamura.com', password: '123456', address: "2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.0938", organization_id: 1},
  {first_name: "PK", last_name: "Kapur", email: 'pk@kapur.com', password: '123456', address: "1-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.7838", organization_id: 1},
  {first_name: "Sousuke", last_name: "Ebina", email: 'sousuke@ebina.com', password: '123456', address: "Spiders Web Apts, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.2253.0938", organization_id: 2},
  {first_name: "Chikara", last_name: "Okada", email: 'chikara@okada.com', password: '123456', address: "LeWagon Startup House #4, 4-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.1354.5938", organization_id: 2},
  {first_name: "Kouhei", last_name: "Takeshita", email: 'kouhei@takeshita.com', password: '123456', address: "Notos Meguro Mansion Apt 5, 1-11-3, Meguro, Meguro-ku, Tokyo 153-0061", phone_number: "080.9354.7638", organization_id: 3},
  {first_name: "Deebee", last_name: "Ooh", email: 'deebee@ooh.com', password: '123456', address: "Instructors Chair Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.0942", organization_id: 4},
  {first_name: "Misaki", last_name: "Iwai", email: 'misaki@iwai.com', password: '123456', address: "Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.1265", organization_id: 1},
  {first_name: "Tetsuya", last_name: "Yokoyama", email: 'tetsuya@yokoyama.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3123.0942", organization_id: 5},
  {first_name: "Keisuke", last_name: "Yoshida", email: 'keisuke@yoshida.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.5023.1208", organization_id: 5},
  {first_name: "Masanori", last_name: "Ushiki", email: 'masanori@ushiki.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.5402.6734", organization_id: 3},
  {first_name: "Masanao", last_name: "Matsumoto", email: 'masanao@matsumoto.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.5619.8956", organization_id: 3},
  {first_name: "Kie", last_name: "Kashiwagi", email: 'kie@kashiwagi.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.1298.0091", organization_id: 4},
  {first_name: "Hidei", last_name: "Nagaoka", email: 'hidei@nagaoka.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.2799.0023", organization_id: 4},
  {first_name: "Paul", last_name: "Gaumer", email: 'paul@gaumer.com', password: '123456', address: "2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.0938", organization_id: 1},
  {first_name: "Sylvain", last_name: "Pierre", email: 'sylvain@pierre.com', password: '123456', address: "1-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.7838", organization_id: 1},
  {first_name: "Hiroko", last_name: "Arai", email: 'hiroko@arai.com', password: '123456', address: "Spiders Web Apts, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.2253.0938", organization_id: 2},
  {first_name: "Kinyoshi", last_name: "Takuyama", email: 'kinyoshi@takuyama.com', password: '123456', address: "LeWagon Startup House #4, 4-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.1354.5938", organization_id: 2},
  {first_name: "Shinichi", last_name: "Tajitsu", email: 'shinichi@tajitsu.com', password: '123456', address: "Notos Meguro Mansion Apt 5, 1-11-3, Meguro, Meguro-ku, Tokyo 153-0061", phone_number: "080.9354.7638", organization_id: 3},
  {first_name: "Teijira", last_name: "Shintsuka", email: 'teijira@shintsuka.com', password: '123456', address: "Instructors Chair Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.0942", organization_id: 4},
  {first_name: "Hayashide", last_name: "Yamato", email: 'hayashide@yamato.com', password: '123456', address: "Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.1265", organization_id: 1},
  {first_name: "Matheus", last_name: "Penchel", email: 'matheus@penchel.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3123.0942", organization_id: 5},
  {first_name: "Maika", last_name: "Kaku", email: 'maika@kaku.com', password: '123456', address: "1 Chome-4 Kamiosaki, Shinagawa-ku, Tokyo 141-0021", phone_number: "080.5023.1208", organization_id: 5},
  {first_name: "Akiko", last_name: "Aijima", email: 'akiko@aijima.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.5402.6734", organization_id: 3},
  {first_name: "Asuka", last_name: "Tasaka", email: 'asuka@tasaka.com', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.5619.8956", organization_id: 3}
].each do |user_params|
  puts user_params
  unless User.find_by(email: user_params[:email].downcase)
    puts User.create!(user_params)
  end
end

Item.create!(name: "food")      # item id 1
Item.create!(name: "water")     #2
Item.create!(name: "clothing")  #3
Item.create!(name: "blankets")  #4
Item.create!(name: "tents")     #5
Item.create!(name: "firstaid")  #6
Item.create!(name: "drivers")   #7
Item.create!(name: "heavy")     #8
Item.create!(name: "general")   #9
Item.create!(name: "fire")      #10
Item.create!(name: "medical")   #11
Item.create!(name: "rescue")    #12

Request.create(user_id: 1, category: "supplies", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, longitude: 139.708126, status: "open", priority: "medium")
Request.create(user_id: 2, category: "fire", address: "A place closer to meguro-ku", latitude: 35.633842, longitude: 139.708826, status: "open", priority: "high")
Request.create(user_id: 3, category: "rescue", address: "Near Naka Meguro station", latitude: 35.631869, longitude: 139.706703, status: "open", priority: "high")
Request.create(user_id: 4, category: "supplies", address: "Down in the meguro river", latitude: 35.633281, longitude: 139.701854, status: "open", priority: "low")
Request.create(user_id: 5, category: "fire", address: "Meguro Police station", latitude: 35.638635, longitude: 139.708012, status: "open", priority: "high")
Request.create(user_id: 6, category: "medical", address: "Bldg opposite Meguro kuyakusho", latitude: 35.632758, longitude: 139.713752, status: "open", priority: "high")
Request.create(user_id: 7, category: "supplies", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 35.637222, longitude: 139.706564, status: "open", priority: "medium")
Request.create(user_id: 8, category: "supplies", address: "2-11-3, Meguro, Meguro-ku, Tokyo", latitude: 35.633959, longitude: 139.708126, status: "open", priority: "high")
Request.create(user_id: 9, category: "volunteer", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, longitude: 139.708126, status: "open", priority: "medium")
Request.create(user_id: 10, category: "fire", address: "A place closer to meguro-ku", latitude: 35.633842, longitude: 139.708426, status: "open", priority: "high")
Request.create(user_id: 11, category: "rescue", address: "Near Naka Meguro station", latitude: 35.631869, longitude: 139.706703, status: "open", priority: "high")
Request.create(user_id: 12, category: "supplies", address: "Down in the meguro river", latitude: 35.633281, longitude: 139.701854, status: "open", priority: "low")
Request.create(user_id: 13, category: "medical", address: "Meguro Police station", latitude: 35.638635, longitude: 139.708012, status: "open", priority: "high")
Request.create(user_id: 14, category: "medical", address: "Bldg opposite Meguro kuyakusho", latitude: 35.632758, longitude: 139.713752, status: "open", priority: "high")
Request.create(user_id: 15, category: "volunteer", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 35.637222, longitude: 139.706564, status: "open", priority: "medium")
Request.create(user_id: 16, category: "supplies", address: "Near Meguro station, opposite JR exit", latitude: 35.633281, longitude: 139.706564, status: "open", priority: "high")
Request.create(user_id: 17, category: "supplies", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, longitude: 139.708126, status: "open", priority: "medium")
Request.create(user_id: 18, category: "volunteer", address: "A place closer to meguro-ku", latitude: 35.633842, longitude: 139.708226, status: "open", priority: "high")
Request.create(user_id: 19, category: "volunteer", address: "Near Naka Meguro station", latitude: 35.631869, longitude: 139.706703, status: "open", priority: "high")
Request.create(user_id: 20, category: "supplies", address: "Down in the meguro river", latitude: 35.633281, longitude: 139.701854, status: "open", priority: "low")
Request.create(user_id: 21, category: "supplies", address: "Meguro Police station", latitude: 35.638635, longitude: 139.708012, status: "open", priority: "high")
Request.create(user_id: 22, category: "volunteer", address: "1 Chome-4 Kamiosaki, Shinagawa-ku, Tokyo 141-0021", latitude: 35.632758, longitude: 139.713752, status: "open", priority: "high")
Request.create(user_id: 23, category: "supplies", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 35.637222, longitude: 139.706564, status: "open", priority: "medium")
Request.create(user_id: 24, category: "supplies", address: "Near Meguro station, opposite JR exit", latitude: 35.633281, longitude: 139.706564, status: "open", priority: "high")

ItemsRequest.create(item_id: 1, request_id: 1, quantity: 20, status: "open")
ItemsRequest.create(item_id: 10, request_id: 2, quantity: 1, status: "open")
ItemsRequest.create(item_id: 12, request_id: 3, quantity: 1, status: "open")
ItemsRequest.create(item_id: 2, request_id: 4, quantity: 30, status: "open")
ItemsRequest.create(item_id: 10, request_id: 5, quantity: 1, status: "open")
ItemsRequest.create(item_id: 11, request_id: 6, quantity: 1, status: "open")
ItemsRequest.create(item_id: 3, request_id: 7, quantity: 10, status: "open")
ItemsRequest.create(item_id: 4, request_id: 8, quantity: 15, status: "open")
ItemsRequest.create(item_id: 7, request_id: 9, quantity: 3, status: "open")
ItemsRequest.create(item_id: 10, request_id: 10, quantity: 1, status: "open")
ItemsRequest.create(item_id: 12, request_id: 11, quantity: 1, status: "open")
ItemsRequest.create(item_id: 5, request_id: 12, quantity: 11, status: "open")
ItemsRequest.create(item_id: 11, request_id: 13, quantity: 1, status: "open")
ItemsRequest.create(item_id: 11, request_id: 14, quantity: 1, status: "open")
ItemsRequest.create(item_id: 8, request_id: 15, quantity: 8, status: "open")
ItemsRequest.create(item_id: 6, request_id: 16, quantity: 8, status: "open")
ItemsRequest.create(item_id: 1, request_id: 17, quantity: 25, status: "open")
ItemsRequest.create(item_id: 9, request_id: 18, quantity: 4, status: "open")
ItemsRequest.create(item_id: 7, request_id: 19, quantity: 1, status: "open")
ItemsRequest.create(item_id: 2, request_id: 20, quantity: 25, status: "open")
ItemsRequest.create(item_id: 1, request_id: 21, quantity: 10, status: "open")
ItemsRequest.create(item_id: 8, request_id: 22, quantity: 15, status: "open")
ItemsRequest.create(item_id: 6, request_id: 23, quantity: 4, status: "open")
ItemsRequest.create(item_id: 2, request_id: 24, quantity: 20, status: "open")

# fix Impact Hub near by requestor asking for 15 Heavy volunteers
request = Request.find(22)
request.created_at = Date.today - 3.days
request.save!

## From Here: 0727 Request_Creation_by_Kouhei
i = 0
EvacuationPoint.all.each do |evp|
  i += 1
  user = User.new
  user.first_name = evp.name
  user.last_name = "shelter"
  user.email = "shelter#{i}@shelter.com"
  user.address = evp.address
  user.latitude = evp.latitude
  user.longitude = evp.longitude
  user.save!(validate: false) # avoid requesting Google API every time

  request = Request.new
  request.user = user
  request.address = user.address
  request.latitude = user.latitude
  request.longitude = user.longitude

  #request.priority =  ## Think later

  request.save!(validate: false) # avoid requesting Google API every time

  items_request = ItemsRequest.new
  items_request.item = Item.find(rand(1..12))
  items_request.request = request
  items_request.quantity = rand(10..100)
  items_request.save!
end

### To Here: 0727 Request_Creation_by_Kouhei

puts 'seed end'

# Original seed requests with Geo coordinates that Chikara has been testing against until WED 26th
#
# request = Request.new(user_id: 1, category: "supplies", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, longitude: 139.708126, status: "open", priority: "medium")
# request.save
# request = Request.new(user_id: 2, category: "fire", address: "A place closer to meguro-ku", latitude: 35.633842, longitude: 139.708226, status: "open", priority: "high")
# request.save
# request = Request.new(user_id: 3, category: "rescue", address: "Near Naka Meguro station", latitude: 35.631869, longitude: 139.706703, status: "open", priority: "high")
# request.save
# request = Request.new(user_id: 4, category: "supplies", address: "Down in the meguro river", latitude: 35.633281, longitude: 139.701854, status: "open", priority: "low")
# request.save
# request = Request.new(user_id: 5, category: "fire", address: "Meguro Police station", latitude: 35.638635, longitude: 139.708012, status: "closed", priority: "high")
# request.save
# # REQUEST #6 below
# request = Request.new(user_id: 6, category: "medical", address: "Bldg opposite Meguro kuyakusho", latitude: 35.632758, longitude: 139.713752, status: "closed", priority: "high")
# request.save
# request = Request.new(user_id: 7, category: "supplies", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 35.637222, longitude: 139.706564, status: "open", priority: "medium")
# request.save
# request = Request.new(user_id: 8, category: "supplies", address: "Near Meguro station, opposite JR exit", latitude: 35.633281, longitude: 139.706564, status: "open", priority: "high")
# request.save
