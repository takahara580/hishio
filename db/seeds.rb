# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: '321@gmail.com',
            password: 'abcdefg3')
            
["赤味噌","白味噌","濃口醬油","薄口醬油"].each do |name|
  Genre.create(name: name)
end

["東北","九州"].each do |name|
  ProducingArea.create(name: name)
end

item = Item.create!(
  genre_id: '1',
  producing_area_id: '1',
  name: '長崎県産　麦味噌',
  text: '麦味噌です',
  is_active: true, # 'true'ではなくtrueに修正
  non_taxed_price: '400',
)

# 画像の添付
file_path = Rails.root.join("app/assets/images/miso.png")
item.item_image.attach(io: File.open(file_path), filename: 'miso.png')
            
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