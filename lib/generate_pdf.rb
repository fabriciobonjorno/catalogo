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
    initialize_x_and_y_variables
    set_title(pdf, products.first)
    products.each do |product|
      pdf.bounding_box([@x, @y], width: 130, height: 800) do
        pdf.image product.image, scale: 0.50 if product&.image&.attached?
        pdf.text product.product_description, size: 12, color: 'FF0000'
        pdf.text "Cód #{product.product_code}", size: 12, color: '0C71E0'

        if (@index_x / 3) == 1
          reset_x
        else
          @index_x += 1
          @x += 130
        end
      end

      reset_y(pdf, product) if (@index_y / 4) == 1
    end
  end

  def footer(pdf)
    footer = "#{Rails.root}/public/footer_background_pdf.png"
    pdf.repeat :all do
      pdf.image footer, at: [0, 0], scale: 0.66
    end
  end

  def initialize_x_and_y_variables
    @index_x = 0
    @index_y = 0
    @x = 50
    @y = 520
  end

  def set_title(pdf, product)
    pdf.bounding_box([20, 680], width: 100, height: 300) do
      pdf.text product.family.family_description, size: 14, color: '0C71E0'
    end
  end

  def reset_x
    @index_x = 0
    @index_y += 1
    @x = 50
    @y -= 250
  end

  def reset_y(pdf, product)
    @index_y = 0
    @y = 520
    pdf.start_new_page
    set_title(pdf, product)
  end
end
