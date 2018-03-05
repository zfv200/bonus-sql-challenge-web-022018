require 'bundler'
Bundler.require
require_relative '../db/seed.rb'

# Setup a DB connection here
DB = {:conn => SQLite3::Database.new("db/guests.db")}




# Pry.start
