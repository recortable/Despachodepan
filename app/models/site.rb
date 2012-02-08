# encoding: utf-8
# Representa el site
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

  def slide_images
    SlideImage.scoped
  end

  def selections
    Selection.order('rev_date DESC')
  end

  def posts
    Post.scoped
  end
end
