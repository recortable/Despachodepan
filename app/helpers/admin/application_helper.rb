module Admin::ApplicationHelper

  def action_separator
    raw '<div class="separator">&nbsp;</div>'
  end

  def textile_info
    raw '<span class="info">Puedes escribir formato <a href="http://elzr.com/static/textile" target="_blank">Textile</a></span>'
  end

  def li_link_to_unless_current(name, options = {}, html_options = {}, &block)
    current = current_page?(options)
    element_class = current ? 'active' : ''
    content_tag(:li, link_to_unless(current, name, options, html_options, &block),
    class: element_class)
  end
end
