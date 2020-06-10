class Dashboard::SubscribersController < DashboardController
  include Exportable
  def index
    @subscribers = Subscriber.all
  end
end