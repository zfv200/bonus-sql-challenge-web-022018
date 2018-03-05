# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  sql = <<-SQL
    SELECT name, COUNT(*)
    FROM guests
    GROUP BY name
    ORDER BY COUNT(*)
    DESC LIMIT 2
    SQL
    DB[:conn].execute(sql)[1]
end


def most_occurring_profession
  sql = <<-SQL
      SELECT occupation, COUNT(OCCUPATION)
      FROM guests
      GROUP BY occupation
      ORDER BY COUNT(OCCUPATION)
      DESC LIMIT 1
    SQL
  DB[:conn].execute(sql)
end

def how_many_bills
  sql = <<-SQL
    SELECT COUNT(*) FROM guests WHERE name LIKE '%Bill%'
  SQL
  DB[:conn].execute(sql)[0][0]
end

def p_stew_dates
  sql = <<-SQL
      SELECT appearance_date FROM guests WHERE name = 'Patrick Stewart'
      SQL

  DB[:conn].execute(sql)
end





#
# class Song
#   attr_accessor :title
#   attr_reader :genre
#
#   def initialize(title , genre)
#     @title = title
#     @genre = genre
#     genre.songs << self
#   end
#
#   # def change_genre(genre)
#   #   self.genre = Genre.find_or_create_by_name(genre)
#   # end
# end
#
# class Genre
#   attr_accessor :name, :songs
#
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#
# end
#
# class Artist
#   # attr_accessor :genres
#
#   #initialization etc. attr_accessors
#   def initialize(name)
#     @name = name
#     # @genres = []
#   end
#
#   def list_genres
#
#   end
#
# end
#
#
#
# rap = Genre.new("rap")
# song1 = Song.new("hello", rap)
#
#
#
# rap = Genre.find_or_create_by_name("rap")
#
# Song.new("hello", rap)
#
# Review.new(customer, restaurant)
