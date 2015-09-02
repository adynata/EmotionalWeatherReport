# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_one = User.new(id: 2, location: "94707", created_at: "2015-08-24 00:20:05", updated_at: "2015-08-24 01:13:55", fname: "Marceline", lname: "Abadeer", email: "robinyone@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: "Robon")

user_two = User.new(id: 3, location: "94601", created_at: "2015-08-23 00:20:05", updated_at: "2015-08-23 01:13:55", fname: "Honey", lname: "Dew", email: "thehumofbees@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: "Honey")

user_three = User.new(id: 1, location: "94606", created_at: "2015-08-22 00:20:05", updated_at: "2015-08-22 01:13:55", fname: "Snowflake", lname: "Bently", email: "clairewoods@gmail.com", encrypted_password: "$2a$10$ClyfpIHKsHjobQwnmWfNZOjFHhmV2szZLagKVQ/RlvB...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-22 01:13:55", last_sign_in_at: "2015-08-22 01:10:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "cNFxmx6s6gZxGruy1CEi", confirmed_at: nil, confirmation_sent_at: "2015-08-22 00:20:05", unconfirmed_email: nil, name: nil)

user_one.password = "password"
user_two.password = "password"
user_three.password = "password"

user_one.save!
user_two.save!
user_three.save!
