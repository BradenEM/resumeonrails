class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy resume_editor ]

  # GET /resumes or /resumes.json
  def index
    @resumes = Current.user.resumes
  end

  # GET /resumes/1 or /resumes/1.json
  def show
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes or /resumes.json
  def create
    @resume = Current.user.resumes.build(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: "Resume was successfully created." }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1 or /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: "Resume was successfully updated." }
        format.json do
          preview_html = render_to_string(partial: "resumes/resume", locals: { resume: @resume }, formats: [ :html ])
          render json: { message: "Saved", resume: @resume, previewHtml: preview_html }, status: :ok
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1 or /resumes/1.json
  def destroy
    @resume.destroy!

    respond_to do |format|
      format.html { redirect_to resumes_path, status: :see_other, notice: "Resume was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def resume_editor
    @resume
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Current.user.resumes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resume_params
      params.expect(resume: [ :name, :email, :phone, :summary, :title  ])
    end
end
