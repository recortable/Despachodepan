class SlideImage < Pan

  RENDER = [:thumb, :position, :body]

  def show_col?(item)
    RENDER.include?(item)
  end

end

