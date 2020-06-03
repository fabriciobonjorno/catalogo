# frozen_string_literal: true

class Dashboard::LinesController < DashboardController
  before_action :line, only: %i[edit update]

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(lines_params)
    if @line.save
      redirect_to dashboard_lines_path, notice: "#{@line.group_description} cadastrado com sucesso!"
    else
      flash.now[:alert] = @line.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @line.update
      redirect_to dashboard_lines_path, notice: "#{@line.group_description} atualizado com sucesso!"
    else
      flash.now[:alert] = @line.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def set_lines
    @line = Line.find(params[:id])
  end

  def lines_params
    params.require(:line).permit(:line_description)
  end
end
