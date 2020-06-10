class Dashboard::SubscribersController < DashboardController
  def index
    @subscribers = Subscriber.all
  end
end