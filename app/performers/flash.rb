# frozen_string_literal: true

module Flash
  module_function

  def as_js
    <<~HTML.strip.html_safe
      <script>
        window.flashIcons          = #{FLASH_ICONS.to_json};
        window.flashDismissSeconds = #{DISMISS_SECONDS};
      </script>
    HTML
  end

  def icon_for(key, value)
    FLASH_ICONS[key.to_sym]
  end

  FLASH_ICONS = {
    alert: 'exclamation-triangle',
    notice: 'thumbs-up',
  }
  private_constant :FLASH_ICONS

  DISMISS_SECONDS = 5
end