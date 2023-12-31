# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: '321@gmail.com',
            password: 'abcdefg3')
            
["米味噌","麦味噌","大豆味噌","調合味噌","白醤油","淡口醤油","濃口醬油","再仕込醤油","溜醤油"].each do |name|
  Genre.create(name: name)
end

["北海道","東北","関東","中部","近畿","中国","四国","九州"].each do |name|
  ProducingArea.create(name: name)
end

item = Item.create!(
  genre_id: '2',
  producing_area_id: '8',
  name: '長崎県産　麦味噌',
  text: '麦味噌です',
  is_active: true,
  non_taxed_price: '400',
)
file_path = Rails.root.join("app/assets/images/miso2.jpg")
item.item_image.attach(io: File.open(file_path), filename: 'miso2.jpg')

item = Item.create!(
  genre_id: '1',
  producing_area_id: '1',
  name: '北海道産　米味噌',
  text: '米味噌です',
  is_active: true,
  non_taxed_price: '500',
)

file_path_second_item = Rails.root.join("app/assets/images/miso1.jpg")
item.item_image.attach(io: File.open(file_path_second_item), filename: 'miso1.jpg')

item = Item.create!(
  genre_id: '3',
  producing_area_id: '2',
  name: '青森県産　大豆味噌',
  text: '大豆味噌です',
  is_active: true,
  non_taxed_price: '700',
)

file_path_second_item = Rails.root.join("app/assets/images/miso3.jpg")
item.item_image.attach(io: File.open(file_path_second_item), filename: 'miso3.jpg')

item = Item.create!(
  genre_id: '5',
  producing_area_id: '3',
  name: '埼玉県産　白醬油',
  text: '白醬油です',
  is_active: true,
  non_taxed_price: '600',
)

file_path_second_item = Rails.root.join("app/assets/images/syoyu1.jpg")
item.item_image.attach(io: File.open(file_path_second_item), filename: 'syoyu1.jpg')

item = Item.create!(
  genre_id: '6',
  producing_area_id: '5',
  name: '京都府産　淡口醤油',
  text: '淡口醬油です',
  is_active: true,
  non_taxed_price: '800',
)

file_path_second_item = Rails.root.join("app/assets/images/syoyu2.jpg")
item.item_image.attach(io: File.open(file_path_second_item), filename: 'syoyu2.jpg')

item = Item.create!(
  genre_id: '7',
  producing_area_id: '3',
  name: '群馬県産　濃口醬油',
  text: '濃口醬油です',
  is_active: true,
  non_taxed_price: '750',
)

file_path_second_item = Rails.root.join("app/assets/images/syoyu3.jpg")
item.item_image.attach(io: File.open(file_path_second_item), filename: 'syoyu3.jpg')
            
Customer.create(last_name: '田中',
                first_name: '愛子',
                last_name_kana: 'タナカ',
                first_name_kana: 'アイコ',
                zip_code: '1234567',
                address: 'テスト住所',
                phone_number: '08099990000',
                email: '123@gmail.com',
                password: 'abcdefg')
                
Customer.create(last_name: '田中',
                first_name: '愛子2',
                last_name_kana: 'タナカ',
                first_name_kana: 'アイコ2',
                zip_code: '1234568',
                address: 'テスト住所2',
                phone_number: '08099990001',
                email: '1234@gmail.com',
                password: 'abcdefg2')