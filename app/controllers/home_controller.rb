# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'
  include MenuResources
  before_action :set_resources, only: %i[index show]
  def index
    @products = Product.order(:product_code).releases_home.page(params[:page]).per(9)
    @subscriber = Subscriber.new
  end


  def newsletter
    @subscriber = Subscriber.new(subscriber_params)  
    if @subscriber.save
      redirect_to((request.referer || '/'), :notice => "Newsletter assinado com sucesso!")
    else
      redirect_to((request.referer || '/'), :alert => "E-mail já cadastrado ou inválido")
    end
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
