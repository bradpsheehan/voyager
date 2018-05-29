class JobApplicationsController < ApplicationController

  def create
    job_application = JobApplication.new(permitted_params)

    if job_application.save
      render json: { application: job_application }, status: :created
    else
      render json: { errors: job_application.errors }, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:job_application).permit!
  end

end
