class PortfolioController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def create
    portfolio_params = params.require(:portfolio).permit(:name, :description)

    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        debugger
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end
end
