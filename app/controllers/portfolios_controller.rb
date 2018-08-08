class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_items= Portfolio.all
  end
  def new

    @portfolio_item = Portfolio.new
  end
  def create
     @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

     respond_to do |format|
       if @portfolio_item.save
         format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
       else
         format.html { render :new }
       end
     end
   end
   def show
   end
   def edit

    end
    def destroy
      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def update


      respond_to do |format|
        if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
          format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end
end
