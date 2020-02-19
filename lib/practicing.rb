


def movies(db) # Array of Movies
  movies_array = []
  director_index = 0
  while director_index < db.length do
    movie_index = 0
    while movie_index < db[director_index][:movies].length do
      movies_array << db[director_index][:movies][movie_index][:title]
      movie_index += 1
    end
    director_index += 1
  end
  p movies_array
end

def movies_hash(db) # Array that contains Hashes of all Movies
  movies_array = [] #is an array of hashes
  director_index = 0
  while director_index < db.length do
    movie_index = 0
    while movie_index < db[director_index][:movies].length do
      movie_hash = db[director_index][:movies][movie_index]
      movies_array << movie_hash
      if !movie_hash[:director_name]
        movie_hash[:director_name] = db[director_index][:name]
      end
      movie_index += 1
    end
    director_index += 1
  end
  p movies_array
end

def directors_and_movies(db) # Array that contains Hashes of Movies
  movies_array = []
  director_index = 0
  while director_index < db.length do
      movies_array << db[director_index]
    movie_index = 0
    while movie_index < db[director_index][:movies].length do
      movies_array << db[director_index][:movies][movie_index][:title]
      movie_index += 1
    end
    director_index += 1
  end
  p movies_array
end

def money_per_studio(db)
  array_of_hash = []
  studio_hash = {}
  i = 0
  while i < db.length do
    j = 0
    while j < db[i][:movies].length do
      studio_key = db[i][:movies][j][:studio]
      if !studio_hash[studio_key]
        studio_hash[studio_key] = db[i][:movies][j][:worldwide_gross]
      end
      array_of_hash << studio_hash
      j += 1
    end
    i += 1
  end
p array_of_hash
end

def list_of_studios(db)
gross_per_studio = {}
list_of_studios = []
# total_gross = 0
  i = 0
  while i < db.length do
    j = 0
    while j < db[i][:movies].length do
      movie_gross = db[i][:movies][j][:worldwide_gross]
      # total_gross += movie_gross
      studio = db[i][:movies][j][:studio]
      if !list_of_studios.include? studio # checks if array contains any elements with same name this way we don't repeat studios.
        list_of_studios << studio
      end
      if !gross_per_studio[studio] #checks if the hash contains the "studio" key, and if not, it creates it and assigns a value
          gross_per_studio[studio] = movie_gross
      else
        gross_per_studio[studio] += movie_gross #if it does exists then it sums up the value
      end

      j += 1
    end
    i += 1
  end
gross_per_studio
end
