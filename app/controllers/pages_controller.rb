class PagesController < ApplicationController
  def home
  end

  def account
    @user = current_user
  end
end
