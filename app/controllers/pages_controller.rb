class PagesController < ApplicationController
  def home
  end

  def dashboard
    @resumes = Resume.all
  end
end
