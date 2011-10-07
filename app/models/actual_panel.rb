class ActualPanel
  def initialize
    
  end

  def news(page = 1)
    @news ||= Slide.where(rol: 'news').order('rev_date DESC').includes(:image).page(page).per(5)
    @news.reverse!
  end

  def width
    width = news.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
    width = 0 unless width
    width < 843 ? 843 : width
  end
end
