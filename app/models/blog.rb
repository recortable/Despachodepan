class Blog
  def posts(page = 1)
    @posts ||= Post.order('rev_date ASC') #.paginate(page: page, per_page: 5)
  end

  def width
    width = posts.each.map { |post| post.width + 10 }.inject { |sum, n| sum + n }
    width = 0 unless width
    width += 90 if has_previous?
    width < 843 ? 843 : width
  end

  def has_previous?
    #posts.current_page < posts.total_pages
    false
  end
end

