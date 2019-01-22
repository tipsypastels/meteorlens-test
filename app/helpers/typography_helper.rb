module TypographyHelper
  def ticker_type(*texts, delay: 75, full_word_delay: 800, repeat: false, **opts)
    texts = texts.join('|')
    
    nbsp_content_tag(:div,
      :'data-ticker-texts'    => texts,
      :'data-delay'           => delay,
      :'data-full-word-delay' => full_word_delay,
      :'data-repeat'          => repeat,
      **opts,
    )
  end
end