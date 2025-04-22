class JobsController < ApplicationController
  before_action :set_resume

  def create
    @resume.jobs.create! params.expect(job: [ :title, :company, :location, :summary ])
    redirect_to @resume, notice: "Job was successfully created."
  end

  def destroy
    @resume.jobs.find(params[:id]).destroy!
    redirect_to @resume, status: :see_other, notice: "Job was successfully destroyed."
  end

  def update
    @resume.jobs.find(params[:id]).update! params.require(:job).permit(:title, :company, :location, :summary)
    redirect_to @resume, notice: "Job was successfully updated."
  end

  private
    def set_resume
      @resume = Resume.find(params[:resume_id])
    end
end
