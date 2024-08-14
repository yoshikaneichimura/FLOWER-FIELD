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

北海道 = Tag.find_or_create_by!(area: "北海道")

東北 = Tag.find_or_create_by!(area: "東北")

関東 = Tag.find_or_create_by!(area: "関東")

信州 = Tag.find_or_create_by!(area: "信越")

東海 = Tag.find_or_create_by!(area: "東海")

北陸 = Tag.find_or_create_by!(area: "北陸")

近畿 = Tag.find_or_create_by!(area: "近畿")

四国 = Tag.find_or_create_by!(area: "四国")

中国 = Tag.find_or_create_by!(area: "中国")

九州 = Tag.find_or_create_by!(area: "九州")

沖縄 = Tag.find_or_create_by!(area: "沖縄")

User.find_or_create_by!(email: "guest@example.com") do |user|
  user.name = "ゲストユーザー"
  user.password = SecureRandom.urlsafe_base64
end

桜井 = User.find_or_create_by!(email: "sakurai@test.com") do |user|
  user.name = "桜井"
  user.password = "password"
  user.introduction = "特に花が好きというわけっじゃないんですけど、、、、皆さんのお役に立てる情報を投稿できるかと思って登録しました。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

lily = User.find_or_create_by!(email: "lily@test.com") do |user|
  user.name = "lily"
  user.password = "password"
  user.introduction = "花は太陽からの光線を自らのエネルギーにして生きている生物である為、光線に対して色彩、形態ともに緻密に計算された生物であると私は考えます。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

jack = User.find_or_create_by!(email: "jack@test.com") do |user|
  user.name = "JACK"
  user.password = "password"
  user.introduction = "花を撮ることよりも、花を描く得意とする者です。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

魔鬼子 = User.find_or_create_by!(email: "makiko@test.com") do |user|
  user.name = "魔鬼子"
  user.password = "password"
  user.introduction = "可愛いお花も良いのですが、さわればケガをしてしまいそうな強い花の方が私は好きです、よろしくお願いします。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

椿 = PostImage.find_or_create_by!(flower: "椿") do |post_image|
  post_image.field = "那覇植物公園"
  post_image.day = "2021-12-25"
  post_image.star = "5"
  post_image.tag = 沖縄
  post_image.user = 魔鬼子
  post_image.address = "沖縄県那覇市　〇ー〇ー〇"
  post_image.detail = "一年を通してさまざまな花を見る事ができる市内での有名な植物園ですね。特に椿はさまざまな種類のものを見る事ができ、この植物園でしか見れない種類のものもありました。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg")
end

牡丹 = PostImage.find_or_create_by!(flower: "牡丹") do |post_image|
  post_image.field = "旭川八幡宮"
  post_image.day = "2022-01-15"
  post_image.star = "4"
  post_image.tag = 北海道
  post_image.user = 魔鬼子
  post_image.address = "北海道旭川市　〇ー〇ー〇"
  post_image.detail = "去年は改修工事中だった牡丹園が、今年はしっかり営業中です。しかし何処を改修したのか分かりませんでした。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
end

梅 = PostImage.find_or_create_by!(flower: "梅") do |post_image|
  post_image.field = "八幡山"
  post_image.day = "2022-2-18"
  post_image.star = "3"
  post_image.tag = 東北
  post_image.user = 魔鬼子
  post_image.address = "岩手県八幡平市　〇ー〇ー〇"
  post_image.detail = "八幡山に蝋梅園がありました、蝋梅園まではロープウェイで行くことができますが、混雑時は１時間以上待ちますので、時間には余裕を持って行動して下さい。また夕暮れ時は蝋梅が夕日を浴びて黄金に輝く幻想的な景色が楽しめますよ。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
end

桜 = PostImage.find_or_create_by!(flower: "桜") do |post_image|
  post_image.field = "春日部公園"
  post_image.day = "2000-03-21"
  post_image.star = "4"
  post_image.tag = 関東
  post_image.user = 桜井
  post_image.address = "埼玉県春日部市　〇ー〇ー〇"
  post_image.detail = "毎年お花見客で賑わう春日部公園、今年もすごい人混みでした。公園入ってすぐのところの桜が特に綺麗な色をしていて、やっぱりそこだけお花見客とでごったがえしてます。あと近くのコンビニですが、やはりこの時期は混みすぎて入れません。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
end

藤 = PostImage.find_or_create_by!(flower: "藤") do |post_image|
  post_image.field = "足利天神"
  post_image.day = "2014-04-20"
  post_image.star = "5"
  post_image.tag = 関東
  post_image.user = 桜井
  post_image.address = "栃木県足利市　〇ー〇ー〇"
  post_image.detail = "社内には池があり真っ赤な橋がかかってました。この真っ赤な橋がかかっていて薄紫の藤の花とよくあってます。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
end

躑躅 = PostImage.find_or_create_by!(flower: "躑躅") do |post_image|
  post_image.field = "千曲神社"
  post_image.day = "2002-05-05"
  post_image.star = "4"
  post_image.tag = 信州
  post_image.user = 桜井
  post_image.address = "長野県千曲市　〇ー〇ー〇"
  post_image.detail = "境内にいたる所に躑躅が咲いていて、また有料で入園できる躑躅園もあります。でも躑躅園って入ってから気が付くんですけど、、、入るよりも遠くから眺めている方が良く見えるんですよねぇ、、、。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
end

紫陽花 = PostImage.find_or_create_by!(flower: "紫陽花") do |post_image|
  post_image.field = "豊橋不動尊"
  post_image.day = "2007-06-20"
  post_image.star = "3"
  post_image.tag = 東海
  post_image.user = lily
  post_image.address = "愛知県豊橋市　〇ー〇ー〇"
  post_image.detail = "豊橋不動尊の紫陽花園は山です。私が登った時は前日の雨もあって山を登って降りてきたら、、、足元が泥だらけでした、気を付けましょう。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg")
end

百合 = PostImage.find_or_create_by!(flower: "百合") do |post_image|
  post_image.field = "かなざわゆり園"
  post_image.day = "2022-07-04"
  post_image.star = "4"
  post_image.tag = 北陸
  post_image.user = lily
  post_image.address = "石川県金沢市　〇ー〇ー〇"
  post_image.detail = "金沢ドームから歩いてしばらくしたところにあります。あと近くのコンビニなんですけど、ちょうど私が行った時に金沢ドームのコンサートがあったみたいで、お客さんでもの凄い列ができてました。もしも行く予定がある方はコンサートの閉演時間なんかの事前に確認が必要かもしれません。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg")
end

向日葵 = PostImage.find_or_create_by!(flower: "向日葵") do |post_image|
  post_image.field = "高槻市ひまわり畑"
  post_image.day = "2022-08-17"
  post_image.star = "5"
  post_image.tag = 近畿
  post_image.user = lily
  post_image.address = "京都府高槻市　〇ー〇ー〇"
  post_image.detail = "まず最寄り駅からのバスの乗り場がすごく分かりづらくて、どうやら違うバス乗ってしまい到着までにものすごい時間がかかりました。またバス停を降りてからもひまわり畑の入口が分かりづらくて、丁度ひまわり畑周りをの一周してようやく入り口の存在に気付きました。でも不思議ですね、、、こんなに広いの場所ににこんなに迷うなんて。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg")
end

曼珠沙華 = PostImage.find_or_create_by!(flower: "曼珠沙華") do |post_image|
  post_image.field = "松山曼珠沙華公園"
  post_image.day = "2022-09-26"
  post_image.star = "4"
  post_image.tag = 四国
  post_image.user = jack
  post_image.address = "高知県松山市"
  post_image.detail = "四国でも有名な花の名所ですね。曼珠沙華は葉が無いので満開時には真っ赤な絨毯ができます。あと何故か公園の周りを流れる川で泳ぐ人たちが続出してます。9月下旬でしたがまだまだ暑かったです。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg")
end

秋桜 = PostImage.find_or_create_by!(flower: "秋桜") do |post_image|
  post_image.field = "しものせき花の国"
  post_image.day = "2021-10-17"
  post_image.star = "3"
  post_image.tag = 中国
  post_image.user = jack
  post_image.address = "山口県下関市　〇ー〇ー〇"
  post_image.detail = "しものせき花の国はとても広いなので、園内を移動するだけでも普通に1時間かかります。入園の際には目的地を事前に確認して、最寄りのゲートから入園しないと大変なことになります。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg")
end

菊 = PostImage.find_or_create_by!(flower: "菊") do |post_image|
  post_image.field = "福岡天神宮"
  post_image.day = "2022-11-11"
  post_image.star = "4"
  post_image.tag = 九州
  post_image.user = jack
  post_image.address = "福岡県福岡市　〇ー〇ー〇"
  post_image.detail = "多くの菊が展示されています。近所の小学校の生徒さん達が育てた菊も展示されてます、大河ドラマの登場人物を模した菊人形なども菊の花の用いたものが多く展示されてました。"
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg")
end

PostComment.find_or_create_by!(comment: "園内には熱帯植物園があり、1年を通してベゴニアの展示を行なってますよね！！") do |post_comment|
  post_comment.user = 桜井
  post_comment.post_image = 椿
end

PostComment.find_or_create_by!(comment: "旭川八幡宮にぼたん園なんてあるんですね、、、、知らなかったです。") do |post_comment|
  post_comment.user = lily
  post_comment.post_image = 牡丹
end

PostComment.find_or_create_by!(comment: "夕陽を浴びて黄金色に輝く蝋梅、、、創造しただけで鳥肌が立ちます！！") do |post_comment|
  post_comment.user = jack
  post_comment.post_image = 梅
end

PostComment.find_or_create_by!(comment: "お花見といえば春日公園ですね。") do |post_comment|
  post_comment.user = lily
  post_comment.post_image = 桜
end

PostComment.find_or_create_by!(comment: "私の友人がここで結婚式を挙げました。") do |post_comment|
  post_comment.user = jack
  post_comment.post_image = 藤
end

PostComment.find_or_create_by!(comment: "そこって鳥居がいっぱいあるところですよね！私も行きました！") do |post_comment|
  post_comment.user = 魔鬼子
  post_comment.post_image = 躑躅
end

PostComment.find_or_create_by!(comment: "そういう時は覚悟して登らないといけませんね。") do |post_comment|
  post_comment.user = 桜井
  post_comment.post_image = 紫陽花
end

PostComment.find_or_create_by!(comment: "国立競技場のLIVE終了後の帰りみたいな感じですか？百合を観に行っただけなのにまさかそんな目に遭うなんて想定外ですね、、、。") do |post_comment|
  post_comment.user = jack
  post_comment.post_image = 百合
end

PostComment.find_or_create_by!(comment: "灯台下暗しです。") do |post_comment|
  post_comment.user = 魔鬼子
  post_comment.post_image = 向日葵
end

PostComment.find_or_create_by!(comment: "僕が以前そこに行った時、前日の台風で橋が流されててびっくりしました。でも、流された橋をよく見るとどうやら川が増水した時に備えてあえて流されやすいように作られているみたいですね。") do |post_comment|
  post_comment.user = 桜井
  post_comment.post_image = 曼珠沙華
end

PostComment.find_or_create_by!(comment: "広い公園は移動だけでも普通に時間かかかりますので、ゲートの確認は必須ですね。") do |post_comment|
  post_comment.user = lily
  post_comment.post_image = 秋桜
end

PostComment.find_or_create_by!(comment: "福岡天神は展示されている菊も見事ですが、ここ社もまた素晴らしいですね！！") do |post_comment|
  post_comment.user = 魔鬼子
  post_comment.post_image = 菊
end

Favorite.find_or_create_by!(user: 桜井, post_image: 椿)
Favorite.find_or_create_by!(user: lily, post_image: 牡丹)
Favorite.find_or_create_by!(user: jack, post_image: 牡丹)
Favorite.find_or_create_by!(user: 桜井, post_image: 梅)
Favorite.find_or_create_by!(user: lily, post_image: 梅)
Favorite.find_or_create_by!(user: jack, post_image: 梅)

Favorite.find_or_create_by!(user: lily, post_image: 桜)
Favorite.find_or_create_by!(user: jack, post_image: 藤)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 藤)
Favorite.find_or_create_by!(user: lily, post_image: 躑躅)
Favorite.find_or_create_by!(user: jack, post_image: 躑躅)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 躑躅)

Favorite.find_or_create_by!(user: 桜井, post_image: 紫陽花)
Favorite.find_or_create_by!(user: jack, post_image: 百合)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 百合)
Favorite.find_or_create_by!(user: 桜井, post_image: 向日葵)
Favorite.find_or_create_by!(user: jack, post_image: 向日葵)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 向日葵)

Favorite.find_or_create_by!(user: 桜井, post_image: 曼珠沙華)
Favorite.find_or_create_by!(user: lily, post_image: 秋桜)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 秋桜)
Favorite.find_or_create_by!(user: 桜井, post_image: 菊)
Favorite.find_or_create_by!(user: lily, post_image: 菊)
Favorite.find_or_create_by!(user: 魔鬼子, post_image: 菊)

Relationship.find_or_create_by!(follower: 桜井, followed: jack)
Relationship.find_or_create_by!(follower: lily, followed: 魔鬼子)

Relationship.find_or_create_by!(follower: jack, followed: 桜井)
Relationship.find_or_create_by!(follower: jack, followed: 魔鬼子)

Relationship.find_or_create_by!(follower: 魔鬼子, followed: 桜井)
Relationship.find_or_create_by!(follower: 魔鬼子, followed: lily)
Relationship.find_or_create_by!(follower: 魔鬼子, followed: jack)

puts "seedの実行が完了しました。"