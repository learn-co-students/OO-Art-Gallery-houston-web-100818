class Gallery

  attr_reader :name, :city
  @@all = []

def initialize(name, city)
  @name = name
  @city = city
  @@all << self
end

def self.all
  @@all
end

def self.cities
  Gallery.all.map do | gallery |
    gallery.city 
  end.uniq
end

# ...then the gallery can display it
def hang_painting(display_painting)
  found_painting = Painting.all.find do | painting |
    painting == display_painting
  end
  found_painting.gallery = self
end

def artists
  Artist.all.select do | artist |
    artist.paintings.find do | painting|
      painting.gallery == self
    end
  end
end

def artist_names
  self.artists.map do | artist |
    artist.name
  end
end

def artists_experience
  years = 0
  self.artists.each do | artist |
    years += artist.years_active
  end 
  years 
end

def paintings
  Painting.all.select do | painting |
    painting.gallery == self
  end
end


end
