module LogoHelper
  def meteor_branding
    if current_page?(root_path) || header_mode.full?
      link_to "Meteor Lens", root_path, class: 'site-logo grows'
    else
      content = [
        link_to(meteor_logo, root_path, class: 'site-logo site-logo-min'),
        fal('angle-right'),
        meteor_breadcrumbs,
      ].join.html_safe

      content_tag :div, content, class: 'grows flex v-center'
    end
  end

  def header_mode!(mode)
    @header_mode = mode
  end

  def header_mode
    @header_mode&.to_s&.inquiry
  end

  def meteor_logo
    [fas('star-half-alt'), '-', fas('star-half-alt')].join.html_safe
  end

  def meteor_breadcrumbs
    content = render_breadcrumbs(
      separator: fal('angle-right'),
      tag: :div,
    )

    content_tag(:div, content, 
      class: 'breadcrumbs',
    )
  end
end