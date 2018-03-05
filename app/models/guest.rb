class Guest
  attr_accessor :id, :year, :occupation, :appearance_date, :topic, :name

  @@file_path = "./daily_show_guests.csv"
  @@guests = []

  def initialize(id =nil, year, occupation, appearance_date, topic, name)
    @id = id
    @year = year
    @occupation = occupation
    @appearance_date = appearance_date
    @topic = topic
    @name = name
  end

  def self.create_table
    sql = <<-SQL
        CREATE TABLE IF NOT EXISTS guests (
        id INTEGER PRIMARY KEY,
        year INTEGER,
        occupation TEXT,
        appearance_date TEXT,
        topic TEXT,
        name TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end

  def self.import
    CSV.foreach(@@file_path) do |guest|
      new_guest = Guest.new(guest[0], guest[1], guest[2], guest[3], guest[4])
      new_guest.save
    end
  end

  def save
    sql = <<-SQL
      INSERT INTO guests (year, occupation, appearance_date, topic, name)
      VALUES (?, ?, ?, ?, ?)
    SQL

    DB[:conn].execute(sql, self.year, self.occupation, self.appearance_date, self.topic, self.name)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM guests")[0][0]
  end

end
