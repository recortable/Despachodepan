class Blog
  def posts
    @posts ||= Post.order('rev_date ASC') #.includes(:image)
  end

  def width
    width = posts.each.map { |post| post.width + 10 }.inject { |sum, n| sum + n }
    width = 0 unless width
    width < 843 ? 843 : width
  end
end

