module Admin::ApplicationHelper

  def action_separator
    raw '<div class="separator">&nbsp;</div>'
  end

  def textile_info
    raw '<span class="info">Puedes escribir formato <a href="http://elzr.com/static/textile" target="_blank">Textile</a></span>'
  end

  def snake_case(str)
    return str.downcase if str =~ /^[A-Z_]+$/
    str.gsub(/\B[A-Z]/, '_\&').squeeze('_') =~ /_*(.*)/
    return $+.downcase
  end
end
