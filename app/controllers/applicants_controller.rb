class ApplicantsController < ApplicationController

  def new
    @job = Job.first
  end

  def create
    applicant = Applicant.new(permitted_params)

    if applicant.save
      session[:user_id] = applicant.id
      redirect_to '/application_portal'
    else
      redirect_to root_path
    end
  end

  private

  def permitted_params
    params.require(:applicant).permit(
      :first_name,
      :last_name,
      :password_confirmation,
      account_attributes: [
        :email,
        :password,
      ])
  end

end
