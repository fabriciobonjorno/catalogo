# frozen_string_literal: true

class Dashboard::TaxClassificationsController < DashboardController
  before_action :set_tax_classification, only: %i[edit update]

  def index
    @tax_classifications = TaxClassification.order(:tax_code).page(params[:page]).per(10)
  end

  def new
    @tax_classification = TaxClassification.new
  end

  def create
    @tax_classification = TaxClassification.new(tax_classifications_params)
    if @tax_classification.save
      redirect_to dashboard_tax_classifications_path, notice: 'Classificação cadastrada com sucesso!'
    else
      flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @tax_classification.update(tax_classifications_params)
      redirect_to dashboard_tax_classifications_path, notice: 'Classificação alterada com sucesso!'
    else
      flash.now[:alert] = @tax_classification.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_tax_classification
    @tax_classification = TaxClassification.find(params[:id])
  end

  def tax_classifications_params
    params.require(:tax_classification).permit(:tax_code)
  end
end
