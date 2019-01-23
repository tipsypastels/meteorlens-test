class ExtendedFormBuilder < ActionView::Helpers::FormBuilder
  def tags_field(attribute = :tag_list, placeholder: nil, **opts)
    text_field(attribute, opts.reverse_merge(
      :'data-taggable-field'       => true,
      :'data-taggable-placeholder' => placeholder,
    ))
  end

  def check_box(attribute, opts = {})
    <<~HTML.strip.html_safe
      <div class="checkbox-container">
        #{super}
        <label for="#{@object_name}_#{attribute}"></label>
      </div>
    HTML
  end
end