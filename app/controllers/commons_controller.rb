class CommonsController < ApplicationController

    def create
      @trade = Trade.find(params[:trade_id])
      @common = @trade.commons.create(params[:common].permit(:name, :common))
      redirect_to trade_path(@trade)    
    end

    def destroy
       @trade = Trade.find(params[:trade_id])
       @common = @trade.commons.find(params[:id])
       @commons.destroy
       redirect_to trade_path(@trade)
    end

    def show
       @trade = Trade.find(params[:trade_id])
       @common = @trade.commons.find(params[:id])
       @common.destroy
       redirect_to trade_path(@trade)
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common
      @common = Common.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def common_params
      params.require(:common).permit(:name, :common)
    end


end
