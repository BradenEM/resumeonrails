class PagesController < ApplicationController
  def home
  end

  def dashboard
    @resumes = Current.user.resumes
  end
end
