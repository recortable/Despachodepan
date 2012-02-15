# encoding: utf-8
# Selected images for each project
class Selection < Pan
  store :settings, accessors: [ :row_position ]

  before_save do
    self.width = 200 if self.file.blank?
  end
end

