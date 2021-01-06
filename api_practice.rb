require 'faraday'
require 'pry'
require 'json'

response = Faraday.get 'https://api.github.com/repos/aetzion1/little-esty-shop'
# response = Faraday.get 'https://api.github.com/repos/aetzion1/little-esty-shop/contributors'
# response = Faraday.get 'https://api.github.com/repos/aetzion1/little-esty-shop/stats/commit_activity'

body = response.body

parsed = JSON.parse(response.body, symbolize_names: true)

binding.pry

repos = parsed.map do |data|
    Repo.new(data)
end

Repo.each do |repo|
    puts repo.name
end
