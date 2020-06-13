class Dashboard::SubscribersController < DashboardController
  include Exportable
  def index
    @subscribers = Subscriber.order(:email).page(params[:page]).per(10)
  end
end