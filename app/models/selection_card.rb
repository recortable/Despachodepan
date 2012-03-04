# SelectionCard
# The selected images from all the projects
class SelectionCard
  def initialize
    all = Selection.reorder('rev_date ASC, updated_at DESC')
    @top = []
    @bottom = []
    all.each do |selection|
      if selection.row_position == 'Arriba'
        @top << selection
      else
        @bottom << selection
      end
    end
  end

  def top
    @top
  end

  def bottom
    @bottom
  end

  def width
    @width ||= calculate_width
  end

  protected
  def calculate_width
    max_top = top.each.map(&:width).inject{|sum, n| sum + 10 + n } + 10 || 200
    max_bottom = bottom.each.map(&:width).inject{|sum, n| sum + 10 + n } || 200
    max_top > max_bottom ? max_top : max_bottom
  end

  def old_w
    if !@width
      max_top = top.each.map { |slide| slide.width + 10 }.inject { |sum, n| sum + n }
      max_bottom = bottom.each.map { |slide| slide.width + 10 }.inject { |sum, n| sum + n }
      @width = (max_top && max_bottom) ? (max_top > max_bottom ? max_top : max_bottom) : 0
      @width = @width < 843 ? 843 : @width
    end
    @width
  end
end
