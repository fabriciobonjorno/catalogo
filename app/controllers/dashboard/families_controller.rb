# frozen_string_literal: true

class Dashboard::FamiliesController < DashboardController
  before_action :set_families, only: %i[edit update]

  def index
    if params[:group_id].present?
      render(json: Family.where(group_id: params[:group_id]))
    else
      # FIXME: this should be in a separate action
      @families = Family.order_family.page(params[:page]).per(10)
    end
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(families_params)
    if @family.save
      redirect_to dashboard_families_path, notice: "#{@family.family_description} cadastrada com sucesso!"
    else
      flash.now[:alert] = @family.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @family.update(families_params)
      redirect_to dashboard_families_path, notice: "#{@family.family_description} atualizada com sucesso!"
    else
      flash.now[:alert] = @family.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_families
    @family = Family.find(params[:id])
  end

  def families_params
    params.require(:family).permit(:family_code, :family_description, :group_id)
  end
end
