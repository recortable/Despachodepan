# encoding: utf-8

class AddBodyToPan < ActiveRecord::Migration
  def change
    errors = []

    Slide.all.each do |slide|
      if slide.body.present?
        puts "Processing slide #{slide.id}: #{slide.rol} - #{slide.pos}"
        clazz = pan_class_by_slide(slide)
        pan = clazz.where(card_id: slide.card_id).where(position: slide.pos)
        if pan.size > 1
          error = "AMBIGÜEDAD! Slide.id == #{slide.id}"
          errors < error
          puts error
        elsif pan.size == 0
          error = "PAN NOT FOUND Slide.id == #{slide.id}"
          errors < error
          puts error
        else
          pan = pan.first
          puts "Pan found #{pan.id}: #{pan.class.to_s} #{pan.position}"
          pan.body = slide.body
          pan.save
        end
      end
    end # Slide.all

    puts errors.inspect
  end


  def pan_class_by_slide(slide)
    if slide.rol == 'slide'
      SlideImage
    elsif slide.rol == 'news'
      Post
    elsif slide.rol == 'selection'
      Selection
    end
  end
end
