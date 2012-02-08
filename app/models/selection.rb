# encoding: utf-8
# Selected images for each project
class Selection < Pan
  # Values for extra
  EXTRA = [:top, :bottom]
  EXTRA_NAME = 'Posición'


  def extra_human_name
    case self.extra
      when 'top'
        'Arriba'
      when 'bottom'
        'Abajo'
      else
        '¡Error! Escribe a Dani.'
    end
  end
end

