class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(file)
    first_split = file.split(" - ")
    first_split[1] = first_split[1].chomp(".mp3")
    song = self.new
    song.artist_name = first_split[0]
    song.name = first_split[1]
    song
  end
  
  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end
  
  def self.destroy_all
    @@all.clear
  end

end
