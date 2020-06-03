# frozen_string_literal: true

require 'prawn'

module GeneratePdf
  PDF_OPTIONS = {
    page_size: 'A4',
    page_layout: :portrait,
    margin: [40, 75]
  }.freeze

  def self.material(products)
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      pdf.fill_color '666666'
      products.each do |product|
        pdf.text 'Descrição'
        pdf.text product.dig(:description), size: 12, style: :bold
        pdf.text 'Código'
        pdf.text product.dig(:code), size: 12
        pdf.move_down 20
      end
      pdf.render_file('public/products.pdf')
    end
  end
end
