# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

Admin.find_or_create_by!(email: "admin@test.com") do |admin|
  admin.name = "admin"
  admin.password = "password"
end

Tag.create([
  { area: '北海道'},
  { area: '東北'},
  { area: '関東'},
  { area: '信越'},
  { area: '東海'},
  { area: '北陸'},
  { area: '近畿'},
  { area: '中国'},
  { area: '四国'},
  { area: '九州'},
  { area: '沖縄'},
  ])

  User.find_or_create_by!(email: "guest@example.com") do |user|
    user.name = "ゲストユーザー"
    user.password = SecureRandom.urlsafe_base64
  end

  User.find_or_create_by!(email: "sakurai@test.com") do |user|
    user.name = "桜井"
    user.password = "password"
    user.introduction = "特に花が好きというわけっじゃないんですけど、、、、皆さんのお役に立てる情報を投稿できるかと思って登録しました。"
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  end

  User.find_or_create_by!(email: "lily@test.com") do |user|
    user.name = "lily"
    user.password = "password"
    user.introduction = "花は太陽からの光線を自らのエネルギーにして生きている生物である為、光線に対して色彩、形態ともに緻密に計算された生物であると私は考えます。"
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  end

  User.find_or_create_by!(email: "jack@test.com") do |user|
    user.name = "JACK"
    user.password = "password"
    user.introduction = "花を撮ることよりも、花を描く得意とする者です。"
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
  end

  User.find_or_create_by!(email: "maikiko@test.com") do |user|
    user.name = "魔鬼子"
    user.password = "password"
    user.introduction = "可愛いお花も良いのですが、さわればケガをしてしまいそうな強い花の方が私は好きです、よろしくお願いします。"
    user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
  end

  # User.find_or_create_by!(email: "@test.com") do |user|
  #   user.name = ""
  #   user.password = "password"
  #   user.introduction = ""
  #   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user.jpg"), filename:"sample-user.jpg")
  # end

  puts "seedの実行が完了しました。"
