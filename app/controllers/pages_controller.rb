class PagesController < ApplicationController
  before_action :authenticate, only: [ :dashboard ]
  def home
  end

  def dashboard
    @resumes = Current.user.resumes
  end
end
