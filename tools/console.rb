require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

moma = Gallery.new("Museum of Modern Art", "New York City")
fam = Gallery.new('Fine Arts Museum', 'Houston')
met = Gallery.new("Metropolitan Museum of Art", "New York City")

da_vinci = Artist.new("Leonardo da Vinci", 100)
picasso = Artist.new("Pablo Picasso", 100)
magritte = Artist.new('Henri Magritte', 100)

mona = da_vinci.make_painting('Mona Lisa', 'realist')
moma.hang_painting(mona)
himself = da_vinci.make_painting("Self-Portrait", "Rennaisance")
met.hang_painting(himself)
guernica = picasso.make_painting('La Guernica', 'cubist')
fam.hang_painting(guernica)
bull = picasso.make_painting('Cubist Bull', 'cubist')
fam.hang_painting(bull)
pipe = magritte.make_painting("The Treachery of Images", "surrealist")
moma.hang_painting(pipe)

binding.pry
