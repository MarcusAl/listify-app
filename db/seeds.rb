# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)

require 'net/http'
require 'json'

puts 'Initialising..'
Movie.destroy_all

def rand_num
  rand(10..200).to_s
end

url = "https://api.themoviedb.org/3/movie/#{rand_num}?api_key=c2b3b6ff79a743ad0080710cde0a1fa5"
uri = URI(url)
response = Net::HTTP.get(uri)
tester = JSON.parse(response)[:success]

puts 'Adding Files to Database..'

25.times do
  next if tester

  title = JSON.parse(response)['title']
  overview = JSON.parse(response)['overview']
  poster = "https://image.tmdb.org/t/p/w500#{JSON.parse(response)['poster_path']}"
  rating = JSON.parse(response)['popularity']
  Movie.create(title: title, overview: overview, poster_url: poster, rating: rating)
end

puts 'Database Seed Complete!'
