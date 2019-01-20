module PartialsHelper
  # shortcut for simple partials
  # don't use this over collection: partials
  # when you're iterating over a list.
  def rp(name, cached: true, **locals)
    render partial: name, locals: locals, cached: true
  end

  # renders a collection
  def rc(name, collection, cached: true, **opts)
    render partial: name, collection: collection, cached: cached, **opts
  end

  def sidebar_partial!(partial, **opts)
    @sidebar_partial = partial
    @sidebar_opts    = opts
  end

  DEFAULT_SIDEBAR = 'sidebar/default'

  def sidebar_partial
    @sidebar_partial || DEFAULT_SIDEBAR
  end
end