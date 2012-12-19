class Image < ActiveRecord::Base

  def find_images
    anchor = /<img .*?src=.*?['":]([^'"}]*)['"].*?>/m
    links = self.scan(anchor)
    binding.pry
  end

end