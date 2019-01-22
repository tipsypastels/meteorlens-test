module FaHelper
  def icon(group, name, opts = {})
    klass = "#{group} fa-#{name} #{opts.delete(:class)}"
    empty_content_tag :i, class: klass, **opts
  end

  %i|fas far fal|.each do |group|
    define_method group do |name, opts = {}|
      icon(group, name, opts)
    end
  end
end