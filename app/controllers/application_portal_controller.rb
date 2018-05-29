class ApplicationPortalController <ApplicationController
  def index
    @job = Job.first || {}
  end
end
