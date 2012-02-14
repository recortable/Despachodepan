class SlideImage < Pan
  acts_as_list

  RENDER = [:thumb, :position, :body]

  def extra_human_name
    extra == 'main' ? 'Principal' : extra
  end

  def show_col?(item)
    RENDER.include?(item)
  end

end

