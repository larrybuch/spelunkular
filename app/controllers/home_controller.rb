class HomeController < ApplicationController
  def index
  end

  def splunk
    link_collection = []
    crawl = Crawler.new(params[:number], link_collection, params[:url])
    base = crawl.party_mode
    binding.pry

    # levels = params[:number].to_i
    # Crawler.recursion(links_array)
    # binding.pry
  end
end