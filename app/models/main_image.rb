# Representa la imágen principal de una ficha
class MainImage < Pan

  after_destroy do
    self.card.update_attribute(:main_image_id, nil)
  end

end