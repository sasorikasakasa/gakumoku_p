# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

User.create!(
  first_name: "aaa",
  last_name: "aaa",
  kana_first_name: "aaa",
  kana_last_name: "aaa",
  email: "aaa@aaa",
  password: "aaaaaa"
)

Group.create!(
  group_name: "sample_group",
  group_introduction: "sampleのグループです。",
  group_image: "ありません。",
)

100.times do |n|
  sample_first_name = Gimei.kanji
  sample_last_name = Gimei.kanji
  sample_kana_first_name = Gimei.katakana
  sample_kana_last_name = Gimei.katakana
  sample_email = Faker::Internet.email
  if n%2 == 0
    status = true
  else
    status = false
  end
  User.create!(
    first_name: sample_first_name,
    last_name: sample_last_name,
    kana_first_name: sample_kana_first_name,
    kana_last_name: sample_kana_last_name,
    email: sample_email,
    password: "000000"
  ).user_groups.create!(
    group_id: 1,
    follow_status: status,
    join_status: status,
  )
end