# frozen_string_literal: true

require 'prawn'

class GeneratePdf < Prawn::Document
  PDF_OPTIONS = {
    page_size: 'A4',
    page_layout: :portrait,
    margin: [100, 0]
  }.freeze

  def execute(products)
    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      header(pdf)
      footer(pdf)
      body(pdf, products)
      pdf.render_file('public/products.pdf')
    end
  end

  def header(pdf)
    header = "#{Rails.root.to_s}/public/header_background_pdf.png"
    pdf.repeat :all do
      pdf.image header, at: [0, 745], scale: 0.66
    end
  end

  def body(pdf, products)
    products.each do |product| 
      pdf.image product.image_url, scale: 0.50 if product&.image&.attached?
      pdf.text product.product_description, size: 12, color: 'FF0000'
      pdf.text "Cód #{product.product_code.to_s}", size: 12, color: '0C71E0'
      pdf.move_down 20
    end
  end

  def footer(pdf)
    footer = "#{Rails.root.to_s}/public/footer_background_pdf.png"
    pdf.repeat :all do
      pdf.image footer, at: [0, 0], scale: 0.66
    end
  end
end
