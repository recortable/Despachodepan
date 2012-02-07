class Post < Pan
  before_save do
    self.width = 200 if self.file.blank?
  end
end

