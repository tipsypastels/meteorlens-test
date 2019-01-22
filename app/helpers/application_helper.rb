module ApplicationHelper
  def empty_content_tag(element, opts = {})
    content_tag element, nil, opts
  end

  def nbsp_content_tag(element, opts = {})
    content_tag element, "&nbsp;".html_safe, opts
  end
end
