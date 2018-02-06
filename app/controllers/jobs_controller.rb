class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    @job.category_id = params[:job][:category_id]
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company 
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    @company = @job.company_id
    if @job.save
      flash[:success] = "Job '#{@job.title}' Updated"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "'#{job.title}' was successfully deleted!"
    redirect_to company_path(job.company_id)
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end