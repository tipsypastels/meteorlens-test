class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def profile
  end

  def save
    done_params = settings_params
    back = done_params.delete(:back)

    if current_user.update(done_params)
      redirect_to settings_path
    else
      render back
    end
  end

  private

  # since #save is used to update multiple
  # pages, :back stores where to re-render
  # if there is an error.
  def settings_params
    params.permit(:back, :avatar, :usertitle, :biography)
  end
end