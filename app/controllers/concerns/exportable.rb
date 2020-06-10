require 'csv'

module Exportable
  extend ActiveSupport::Concern

  def export_csv
    headers = ['ID', 'Email']

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      Subscriber.all.each do |subscriber|
        row << [
          subscriber.id,
          subscriber.email
        ]
      end
    end

    send_data csv, type: 'text/csv; charset=utf-8; header=present',
      disposition: 'attachment; filename=Emails.csv'
  end
end