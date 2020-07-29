# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  self.abstract_class = true

  def default_url_options 
    { host: "brokermatogrosso.meucatalogo.art.br"} if Rails.env.production?
  end
end
