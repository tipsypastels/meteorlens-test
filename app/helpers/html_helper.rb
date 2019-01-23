module HtmlHelper
  def body_class!(name)
    @body_class ||= ''
    @body_class << " #{name}"
  end

  def no_header!
    @no_header = true
  end

  def no_flash!
    @no_flash = true
  end
end