module TypographyHelper
  def ticker_type(*texts, delay: 100, full_word_delay: 1000, repeat: false, **opts)
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