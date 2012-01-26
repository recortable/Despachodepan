class Actual 
  def news
    @news ||= Post.order('rev_date ASC') #.includes(:image)
  end

  def width
    width = news.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
    width = 0 unless width
    width < 843 ? 843 : width
  end
end

