module ApplicationHelper
  def title(text, el = :h1)
    content_for(:title) { text }
    content_tag el, text, class: :title
  end

  def render_body(model)
    markdown(model.body)
  end

  def markdown(text, limit = nil)
    text = '' if text.blank?
    text.gsub! /"([^"]*)":([^\s]*)/, '[\1](\2)'
    text = truncate(text, :length => limit) if limit.present?
    redcarpet.render(text).html_safe
  end

  def redcarpet
    @redcarpet ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                           hard_wrap: true, autolink: true,
                                           no_intraemphasis: true,
                                           space_after_headers: true)
  end

  def simple_debug(object)
    if Rails.env.development?
      content_tag(:div, debug(object), class: 'simple-debug') if object.present?
    end
  end


end
