# encoding = utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u1 = User.create!(name: "정성현")
u2 = User.create!(name: "박요섭")
u3 = User.create!(name: "진창훈")
u4 = User.create!(name: "박건하")
u5 = User.create!(name: "박선재")
u6 = User.create!(name: "정창환")
u7 = User.create!(name: "손어지리")
u8 = User.create!(name: "왕수용")
u9 = User.create!(name: "류화")
u10 = User.create!(name: "오수진")
u11 = User.create!(name: "구진효")
u12 = User.create!(name: "윤성욱")
u13 = User.create!(name: "태연")
u14 = User.create!(name: "제시카")
u15 = User.create!(name: "티파니")
u16 = User.create!(name: "윤아")
u17 = User.create!(name: "유리")
u18 = User.create!(name: "서현")
u19 = User.create!(name: "써니")
u20 = User.create!(name: "수영")


# 정성현의 팔로인은..
u1.folloings << u2
u1.folloings << u3
u1.folloings << u5
u1.folloings << u6
u1.folloings << u8
u1.folloings << u11
# 박요섭의 팔료임은
u2.folloings << u3
u2.folloings << u6
u2.folloings << u9
u2.folloings << u1
u2.folloings << u5
# 진창훈의 팔로잉은
u3.folloings << u1
u3.folloings << u2
u3.folloings << u8
u3.folloings << u4
u3.folloings << u10
u3.folloings << u11
u3.folloings << u6
# 박건하의 팔로잉은
u4.folloings << u1
u4.folloings << u2
u4.folloings << u3
u4.folloings << u5
u4.folloings << u6
u4.folloings << u7
u4.folloings << u8
# 박선재의 팔로잉은
u5.folloings << u3
u5.folloings << u4
u5.folloings << u7
u5.folloings << u8
# 정창환의 팔로잉은
u6.folloings << u1
u6.folloings << u2
u6.folloings << u3
u6.folloings << u4
u6.folloings << u5
u6.folloings << u7
u6.folloings << u8

# 손어지리의 팔로인은
u7.folloings << u5
u7.folloings << u8
u7.folloings << u10

# 왕수용의 팔로잉은
u8.folloings << u1
u8.folloings << u2
u8.folloings << u3
u8.folloings << u4
u8.folloings << u5
u8.folloings << u6
u8.folloings << u7
u8.folloings << u9
u8.folloings << u10
u8.folloings << u11
u8.folloings << u12
# 류화의 팔로잉은
u9.folloings << u11
u9.folloings << u3
u9.folloings << u4
u9.folloings << u5
u9.folloings << u7
u9.folloings << u10
u9.folloings << u12

# 오수진의 팔로잉은
u10.folloings << u9
u10.folloings << u11
u10.folloings << u12
u10.folloings << u8
u10.folloings << u3

# 구진효의 팔로잉은
u11.folloings << u5
u11.folloings << u8
u11.folloings << u11
u11.folloings << u10
u11.folloings << u3
u11.folloings << u4

# 윤성욱의 팔로잉은

u12.folloings << u3
u12.folloings << u4
u12.folloings << u6
u12.folloings << u8
u12.folloings << u10

# 태연의 팔로잉은

u13.folloings << u14
u13.folloings << u15
u13.folloings << u16
u13.folloings << u17
u13.folloings << u18

# 제시카의 팔로잉은

u14.folloings << u13
u14.folloings << u15
u14.folloings << u16
u14.folloings << u20
u14.folloings << u19
u14.folloings << u18

# 티파니의 팔로잉은

u15.folloings << u13
u15.folloings << u15
u15.folloings << u17
u15.folloings << u18
u15.folloings << u19
u15.folloings << u20

# 윤아의 팔로잉은

u16.folloings << u13
u16.folloings << u14
u16.folloings << u16
u16.folloings << u17
u16.folloings << u18
u16.folloings << u19
u16.folloings << u20

# 유리의 팔로잉은

u17.folloings << u13
u17.folloings << u14
u17.folloings << u17
u17.folloings << u18
u17.folloings << u19
u17.folloings << u20

# 서현의 팔로잉은
u18.folloings << u13
u18.folloings << u14
u18.folloings << u15
u18.folloings << u16
u18.folloings << u17
u18.folloings << u19


# 써니의 팔로잉은
u19.folloings << u13
u19.folloings << u14
u19.folloings << u15
u19.folloings << u16
u19.folloings << u17
u19.folloings << u18


# 수영의 팔로잉은
u20.folloings << u13
u20.folloings << u14
u20.folloings << u15
u20.folloings << u16
u20.folloings << u17
u20.folloings << u18
u20.folloings << u19

t1 = u1.tweets.build(content: "안녕")
t2 = u2.tweets.build(content: "안녕하세요")
t3 = u3.tweets.build(content: "hi")
t4 = u4.tweets.build(content: "ㅋㅋㅋ")
t5 = u5.tweets.build(content: "ㅇㅇ")
t6 = u6.tweets.build(content: "bye")
t7 = u7.tweets.build(content: ".....")
t8 = u8.tweets.build(content: "어서오세요")
t9 = u9.tweets.build(content: "..")
t10 = u10.tweets.build(content: "니하오")
t11 = u11.tweets.build(content: "ㅇㅇ")
t12 = u12.tweets.build(content: "반가워요")
t13 = u13.tweets.build(content: "지금은 소녀시대")
t14 = u14.tweets.build(content: "ㅋㅋㅋ")
t15 = u15.tweets.build(content: "뭐래니")
t16 = u16.tweets.build(content: "헐")
t17 = u17.tweets.build(content: "킈")
t18 = u18.tweets.build(content: "ㅂㅇ")
t19 = u19.tweets.build(content: "수고하세요")
t20 = u20.tweets.build(content: "끝")

t1.favorites << u1

