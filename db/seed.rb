# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
# require 'pry'
# puts Dir.pwd
#
# require 'csv'
# require 'sqlite3'
# require_relative '../config/environment.rb'

# require_relative './config/environment.rb'
#
# file_path = "./daily_show_guests.csv"
#
# DB = {:conn => SQLite3::Database.new("db/guests.db")}

#create a Guest class
require_relative '../app/models/guest.rb'

# 
# Guest.create_table
# Guest.import
