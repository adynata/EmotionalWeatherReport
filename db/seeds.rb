# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# user_one = User.new(id: 2, location: "94707", created_at: "2015-08-24 00:20:05", updated_at: "2015-08-24 01:13:55", fname: "Marceline", lname: "Abadeer", email: "robinyone@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: "Robon")
#
# user_two = User.new(id: 3, location: "94601", created_at: "2015-08-23 00:20:05", updated_at: "2015-08-23 01:13:55", fname: "Honey", lname: "Dew", email: "thehumofbees@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: "Honey")
#
# user_three = User.new(id: 1, location: "94606", created_at: "2015-08-22 00:20:05", updated_at: "2015-08-22 01:13:55", fname: "Snowflake", lname: "Bently", email: "clairewoods@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: nil)
#
# user_four = User.new(id: 4, location: "94606", created_at: "2015-08-22 00:20:05", updated_at: "2015-08-22 01:13:55", fname: "Sabrina", lname: "Vargas", email: "dig.s.vargas@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 42, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: nil)
#
# user_one.password = "password"
# user_two.password = "password"
# user_three.password = "password"
# user_four.password = "password"
#
#
# user_one.save!
# user_two.save!
# user_three.save!
# user_four.save!
#
#
# 30.times do |i|
#   user = User.new(
#       id: 5 + i,
#       location: Faker::Address.zip_code,
#       created_at: Faker::Time.between(10.days.ago, Time.now, :all),
#       updated_at: Faker::Time.between(10.days.ago, Time.now, :all),
#       fname: Faker::Name.first_name,
#       lname: Faker::Name.last_name,
#       email: Faker::Internet.email,
#       encrypted_password: nil,
#       reset_password_token: nil,
#       reset_password_sent_at: nil,
#       remember_created_at: nil,
#       sign_in_count: Faker::Number.between(1, 50),
#       current_sign_in_at: Faker::Time.between(10.days.ago, Time.now, :all),
#       last_sign_in_at: Faker::Time.between(10.days.ago, Time.now, :all),
#       current_sign_in_ip: "::1",
#       last_sign_in_ip: "::1",
#       confirmation_token: Faker::Internet.password,
#       confirmed_at: nil,
#       confirmation_sent_at: Faker::Time.between(10.days.ago, Time.now, :all),
#       unconfirmed_email: nil,
#       name: Faker::Internet.user_name
#       )
#   user.password = Faker::Internet.password
#
#   user.save!
#
# end

10.times do
  feel = Feel.new(
    id: Feel.all.count + 1,
    feel: Feel.all_feels[rand(0..(Feel.all_feels.length))],
    user_id: __,
    created_at: nil,
    updated_at: nil)
  feel.save!
end

# 100.times.do
#   <Friendship id: nil, created_at: nil, updated_at: nil, user_id: nil, friend_id: nil, status: nil, blocked: nil, accepted_at: nil>
# end
