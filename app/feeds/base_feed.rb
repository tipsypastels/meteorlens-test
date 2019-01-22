class BaseFeed
  class << self
    attr_accessor :model
    
    def for(user, page)
      new(user, page).fetch
    end
  end

  def initialize(user, page)
    @user = user
    @page = page
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
    model.where('user_id IN (?) OR user_id = ?',
      @user.all_following.collect(&:id), @user.id,
    )
  end

  def fetch_for_anon
    model
  end

  def model
    self.class.model
  end
end