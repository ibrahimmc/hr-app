class JobsController < ApplicationController
  def index
    matching_jobs = Job.all

    @list_of_jobs = matching_jobs.order({ :created_at => :desc })

    render({ :template => "jobs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/show.html.erb" })
  end

  def create
    the_job = Job.new
    the_job.title = params.fetch("query_title")
    the_job.industry = params.fetch("query_industry")
    the_job.yearly_usd_salary = params.fetch("query_yearly_usd_salary")
    the_job.job_description = params.fetch("query_job_description")
    the_job.years_of_exp = params.fetch("query_years_of_exp")
    the_job.company_id = params.fetch("query_company_id")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :notice => "Job failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.title = params.fetch("query_title")
    the_job.industry = params.fetch("query_industry")
    the_job.yearly_usd_salary = params.fetch("query_yearly_usd_salary")
    the_job.job_description = params.fetch("query_job_description")
    the_job.years_of_exp = params.fetch("query_years_of_exp")
    the_job.company_id = params.fetch("query_company_id")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => "Job failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
