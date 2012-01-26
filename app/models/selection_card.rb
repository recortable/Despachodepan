
class SelectionCard
  def top
    @top ||= SlideImage.where(extra: 'top').order('rev_date ASC')
  end
  
  def bottom
    @bottom ||= SlideImage.where(extra: 'bottom').order('rev_date ASC')
  end

  def old_top
    @top ||= Slide.all(:conditions => {
        :rol => 'selection',
        :extra => 'top'
      }, :order => 'rev_date ASC', :include => :image)
  end

  def old_bottom
    @bottom ||= Slide.all(:conditions => {
        :rol => 'selection',
        :extra => 'bottom'
      }, :order => 'rev_date ASC', :include => :image)
  end

  def width
    if !@width
      max_top = top.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
      max_bottom = bottom.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
      @width = (max_top && max_bottom) ? (max_top > max_bottom ? max_top : max_bottom) : 0
      @width = @width <  843 ? 843 : @width
    end
    @width
  end
end
