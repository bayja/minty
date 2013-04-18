# encoding = utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u1 = User.create!(name: "JungSH", phone: "010-1111-2222", email: "asdf@asdf.com", password: "123456")
u2 = User.create!(name: "ParkYS", phone: "010-1111-2223", email: "asdf@asdf.com", password: "123456")
u3 = User.create!(name: "JinCH", phone: "010-1111-2224", email: "asdf@asdf.com", password: "123456")
u4 = User.create!(name: "ParkGH", phone: "010-1111-2225", email: "asdf@asdf.com", password: "123456")
u5 = User.create!(name: "ParkSJ", phone: "010-1111-2226", email: "asdf@asdf.com", password: "123456")
u6 = User.create!(name: "JungCH", phone: "010-1111-2227", email: "asdf@asdf.com", password: "123456")
u7 = User.create!(name: "SonAZR", phone: "010-1111-2228", email: "asdf@asdf.com", password: "123456")
u8 = User.create!(name: "WangSY", phone: "010-1111-2229", email: "asdf@asdf.com", password: "123456")
u9 = User.create!(name: "RyuH", phone: "010-1111-2210", email: "asdf@asdf.com", password: "123456")
u10 = User.create!(name: "OhSJ", phone: "010-1111-2211", email: "asdf@asdf.com", password: "123456")
u11 = User.create!(name: "GooJH", phone: "010-1111-2212", email: "asdf@asdf.com", password: "123456")
u12 = User.create!(name: "WoonSW", phone: "010-1111-2213", email: "asdf@asdf.com", password: "123456")
u13 = User.create!(name: "KimTY", phone: "010-1111-2214", email: "asdf@asdf.com", password: "123456")
u14 = User.create!(name: "Jessica", phone: "010-1111-2215", email: "asdf@asdf.com", password: "123456")
u15 = User.create!(name: "Tiffany", phone: "010-1111-2216", email: "asdf@asdf.com", password: "123456")
u16 = User.create!(name: "YoonA", phone: "010-1111-2217", email: "asdf@asdf.com", password: "123456")
u17 = User.create!(name: "Yoori", phone: "010-1111-2218", email: "asdf@asdf.com", password: "123456")
u18 = User.create!(name: "SeoH", phone: "010-1111-2219", email: "asdf@asdf.com", password: "123456")
u19 = User.create!(name: "Sunny", phone: "010-1111-2220", email: "asdf@asdf.com", password: "123456")
u20 = User.create!(name: "SooY", phone: "010-1111-2221", email: "asdf@asdf.com", password: "123456")


# 정성현의 팔로잉은..
u1.followings << u2
u1.followings << u3
u1.followings << u5
u1.followings << u6
u1.followings << u8
u1.followings << u11
# 박요섭의 팔료잉은
u2.followings << u3
u2.followings << u6
u2.followings << u9
u2.followings << u1
u2.followings << u5
# 진창훈의 팔로잉은
u3.followings << u1
u3.followings << u2
u3.followings << u8
u3.followings << u4
u3.followings << u10
u3.followings << u11
u3.followings << u6
# 박건하의 팔로잉은
u4.followings << u1
u4.followings << u2
u4.followings << u3
u4.followings << u5
u4.followings << u6
u4.followings << u7
u4.followings << u8
# 박선재의 팔로잉은
u5.followings << u3
u5.followings << u4
u5.followings << u7
u5.followings << u8
# 정창환의 팔로잉은
u6.followings << u1
u6.followings << u2
u6.followings << u3
u6.followings << u4
u6.followings << u5
u6.followings << u7
u6.followings << u8

# 손어지리의 팔로잉은
u7.followings << u5
u7.followings << u8
u7.followings << u10

# 왕수용의 팔로잉은
u8.followings << u1
u8.followings << u2
u8.followings << u3
u8.followings << u4
u8.followings << u5
u8.followings << u6
u8.followings << u7
u8.followings << u9
u8.followings << u10
u8.followings << u11
u8.followings << u12
# 류화의 팔로잉은
u9.followings << u11
u9.followings << u3
u9.followings << u4
u9.followings << u5
u9.followings << u7
u9.followings << u10
u9.followings << u12

# 오수진의 팔로잉은
u10.followings << u9
u10.followings << u11
u10.followings << u12
u10.followings << u8
u10.followings << u3

# 구진효의 팔로잉은
u11.followings << u5
u11.followings << u8
u11.followings << u11
u11.followings << u10
u11.followings << u3
u11.followings << u4

# 윤성욱의 팔로잉은

u12.followings << u3
u12.followings << u4
u12.followings << u6
u12.followings << u8
u12.followings << u10

# 태연의 팔로잉은

u13.followings << u14
u13.followings << u15
u13.followings << u16
u13.followings << u17
u13.followings << u18

# 제시카의 팔로잉은

u14.followings << u13
u14.followings << u15
u14.followings << u16
u14.followings << u20
u14.followings << u19
u14.followings << u18

# 티파니의 팔로잉은

u15.followings << u13
u15.followings << u15
u15.followings << u17
u15.followings << u18
u15.followings << u19
u15.followings << u20

# 윤아의 팔로잉은

u16.followings << u13
u16.followings << u14
u16.followings << u16
u16.followings << u17
u16.followings << u18
u16.followings << u19
u16.followings << u20

# 유리의 팔로잉은

u17.followings << u13
u17.followings << u14
u17.followings << u17
u17.followings << u18
u17.followings << u19
u17.followings << u20

# 서현의 팔로잉은
u18.followings << u13
u18.followings << u14
u18.followings << u15
u18.followings << u16
u18.followings << u17
u18.followings << u19


# 써니의 팔로잉은
u19.followings << u13
u19.followings << u14
u19.followings << u15
u19.followings << u16
u19.followings << u17
u19.followings << u18


# 수영의 팔로잉은
u20.followings << u13
u20.followings << u14
u20.followings << u15
u20.followings << u16
u20.followings << u17
u20.followings << u18
u20.followings << u19

t1 = u1.tweets.build(content: "안녕")
t1.save
t2 = u2.tweets.build(content: "안녕하세요")
t2.save
t3 = u3.tweets.build(content: "hi")
t3.save
t4 = u4.tweets.build(content: "ㅋㅋㅋ")
t4.save
t5 = u5.tweets.build(content: "ㅇㅇ")
t5.save
t6 = u6.tweets.build(content: "bye")
t6.save
t7 = u7.tweets.build(content: ".....")
t7.save
t8 = u8.tweets.build(content: "어서오세요")
t8.save
t9 = u9.tweets.build(content: "..")
t9.save
t10 = u10.tweets.build(content: "니하오")
t10.save
t11 = u11.tweets.build(content: "ㅇㅇ")
t11.save
t12 = u12.tweets.build(content: "반가워요")
t12.save
t13 = u13.tweets.build(content: "지금은 소녀시대")
t13.save
t14 = u14.tweets.build(content: "ㅋㅋㅋ")
t14.save
t15 = u15.tweets.build(content: "뭐래니")
t15.save
t16 = u16.tweets.build(content: "헐")
t16.save
t17 = u17.tweets.build(content: "킈")
t17.save
t18 = u18.tweets.build(content: "ㅂㅇ")
t18.save
t19 = u19.tweets.build(content: "수고하세요")
t19.save
t20 = u20.tweets.build(content: "끝")
t20.save

