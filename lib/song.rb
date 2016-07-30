class Song
  attr_accessor :name, :name_of_artist

  @@all = []

  def self.all
    @@all
  end

  def save   #why does this method have to be first?
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  # def save
  #   self.class.all << self
  # end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
       song.name == name
     end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} #not sure about this syntax
  end

  def self.new_from_filename(filename)
    filename_array = filename.chomp!(".mp3").split(" - ") #is there a way to do this without
    #the weird " - " I had to guess and check with the spacing a few times 
    song = self.new
    song.name_of_artist = filename_array[0]
    song.name = filename_array[1]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
