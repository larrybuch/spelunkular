class Image < ActiveRecord::Base

  def find_images
    anchor = /<a .*?href?.*?['"]([^'"]*)['"].*?>\w*?<\/a>/m
    links = self.scan(anchor)
    binding.pry
  end

end