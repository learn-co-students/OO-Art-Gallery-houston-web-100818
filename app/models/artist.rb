class Artist

  attr_reader :name, :years_active
  @@all = []

  def initialize(name, years_active)
    @name = name
    @years_active = years_active
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select do | painting |
      painting.artist == self
    end
  end

  # First the artist paints...
  def make_painting(title, style)
    Painting.new(title, style, self, nil)
  end

  def galleries
    Gallery.all.select do | gallery |
      gallery.paintings.find do | painting |
        painting.artist == self
      end 
    end
  end

  def cities
    self.galleries.map do | gallery |
      gallery.city
    end.uniq
  end

  def self.avg_experience
    total_experience = 0

    Artist.all.each do | artist |
      total_experience += artist.years_active
    end
    total_experience / Artist.all.size
  end

end
