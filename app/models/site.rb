# encoding: utf-8


class Site

  def title
    'l a p a n a d e r í a'
  end

  def card_files
    CardFile.scoped
  end
end