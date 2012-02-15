class SlideImage < Pan
  store :settings, accessors: [ :timeline_position, :text_align]

  RENDER = [:thumb, :position, :body]

  def extra_human_name
    extra == 'main' ? 'Principal' : extra
  end

  def show_col?(item)
    RENDER.include?(item)
  end

end

