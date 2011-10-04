module ApplicationHelper
  def title(text, el = :h1)
    content_for(:title) { text }
    content_tag el, text, class: :title
  end

  def markdown(text, limit = nil)
    text = '' if text.blank?
    text =  truncate(text, :length => limit) if limit.present?
    # REMOVED_OPTIONS: :filter_html,
    options = [:hard_wrap,  :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe
  end


end
