# SelectionCard
# The selected images from all the projects
class SelectionCard
  def top
    @top ||= Selection.where(extra: 'top').order('rev_date ASC')
  end
  
  def bottom
    @bottom ||= Selection.where(extra: 'bottom').order('rev_date ASC')
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
