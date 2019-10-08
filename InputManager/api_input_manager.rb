require_relative 'input_manager'
require 'net/http'
require 'json'

# Usar o DBLP para capturar títulos de artigos científicos via API
class ApiInputManager
  attr_accessor :results, :title_list
  include InputManager

  BASE_URL = 'https://dblp.org/search/publ/api'
  def initialize
    @results = nil
    @title_list = []
  end
  
  def make_request(query)
    params = { q: query, format: "json" }
    url = URI.parse(BASE_URL)
    url.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(url)
    @results = JSON.parse(response.body)["result"]["hits"]["hit"]
  end

  def build_list
    @results.each do |result|
      @title_list.push(result["info"]["title"])
    end
  end
end