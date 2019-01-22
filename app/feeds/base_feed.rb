class BaseFeed
  def self.for(user, page, model)
    new(user, page, model).fetch
  end

  def initialize(user, page, model)
    @user  = user
    @page  = page
    @model = model
  end

  def fetch
    if user?
      fetch_for_user
    else
      fetch_for_anon
    end.paginate(page: @page)
  end

  private

  def user?
    @user.present?
  end

  def fetch_for_user
    @model.where('user_id IN (?) OR user_id = ?',
      @user.all_following.collect(&:id), @user.id,
    )
  end

  def fetch_for_anon
    @model
  end
end