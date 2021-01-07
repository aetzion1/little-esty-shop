require 'faraday'
require 'json'
require 'pry'
require 'repo'

module RepoSearch

    def repo
        get url("/repos/aetzion1/little-esty-shop")
    end

    def collaborators
        get url("/repos/aetzion1/little-esty-shop/collaborators")
    end
    
    def repo_info#(url)
        # response = Faraday.get("https://api.github.com#{url}"
        response = Faraday.get("https://api.github.com/repos/aetzion1/little-esty-shop")
        parsed = JSON.parse(response.body, symbolize_names: true)
        binding.pry
        parsed.map do |data|
            Repo.new(data)
            # if data[0] == :name
            # end
        end
    end
end

# class RepoInfo
#     def repos
#         service.repos.map do |data|
#             Repo.new(data)
#         end
#     end

#     def service
#         EstyService.new
#     end
# end

# class EstyService
#     def repos
#         response = Faraday.get 'https://api.github.com/repos/aetzion1/little-esty-shop'
#         parsed = JSON.parse(response.body, symbolize_names: true)
#     end
# end