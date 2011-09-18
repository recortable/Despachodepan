module Admin::ApplicationHelper
  def title(text, el = :h1)
    content_for(:title) {text}
    content_tag el, text, class: :title
  end
end
