module Admin::CardsHelper
  def color_example(value)
    content_tag(:div, value, class: 'color_example', style: "background-color: ##{value}")
  end
end
