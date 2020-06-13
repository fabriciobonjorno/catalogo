# frozen_string_literal: true

class Dashboard::GroupsController < DashboardController
  before_action :set_groups, only: %i[edit update]

  def index
    @groups = Group.order(:group_code).page(params[:page]).per(10)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to dashboard_groups_path, notice: "#{@group.group_description} cadastrado com sucesso!"
    else
      flash.now[:alert] = @group.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to dashboard_groups_path, notice: "#{@group.group_description} atualizado com sucesso!"
    else
      flash.now[:alert] = @group.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_groups
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:group_code, :group_description, :line_id)
  end
end
