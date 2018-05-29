class ApplicationPortalController <ApplicationController
  before_action :authorize

  def index
    @job = Job.first || {}
  end
end
