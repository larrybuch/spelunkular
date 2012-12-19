class Crawler < ActiveRecord::Base
  # @anchor = /<a .*?href?.*?['"]([^'"]*)['"].*?>\w*?<\/a>/m

  def initialize(c, a, u)
    @counter = c
    @link_collection = a
    @base_url = u
  end

  def party_mode
    begin
      @site = HTTParty.get(@base_url).to_s
    rescue
    end
    links = @site.scan(/<a .*?href?.*?['"]([^'"]*)['"].*?>\w*?<\/a>/m).flatten
    links.each do |link|
      if URI.parse(link).relative? == true
        URI.join(@base_url, link)
      end
    end
  end

  def recursion
    @link_collection.each do |link|
      unless @link_collection.flatten.include?(link)
        @link_collection << Crawler.party_mode(link)
      end
  #
  #     puts @link_collection
  #   end
  #   puts 'YOU DONE PLAYA'
  # end
end