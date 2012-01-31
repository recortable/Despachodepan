# encoding: utf-8


class Site

  def id
    nil
  end

  def title
    'l a p a n a d e r í a'
  end

  def card_files
    CardFile.scoped
  end

  def slides
    Slide.scoped
  end

  def selections
    Slide.selected
  end

  def posts
    Post.scoped
  end
end
