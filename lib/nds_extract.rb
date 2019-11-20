# Provided, don't edit
require 'directors_database'

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
def movies_with_director_key(name, movies_collection)
  i = 0
  while i < movies_collection.length
    movie = movies_collection[i]
    movie[:director_name] = name

    i += 1
  end

  movies_collection
end

def gross_per_studio(collection)
  gross_studio = Hash.new(0)

  i = 0
  while i < collection.length
    studio = collection[i][:studio]
    revenue = collection[i][:worldwide_gross]
    gross_studio[studio] += revenue

    i += 1
  end

  gross_studio
end

def movies_with_directors_set(source)
  movies = []

  i = 0
  while i < source.length
    director_name = source[i][:name]
    director_movies = source[i][:movies]

    j = 0
    while j < director_movies.length
      movie = director_movies[j]
      movie[:director_name] = director_name
      movies << [movie]

      j += 1
    end

    i += 1
  end

  movies
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
