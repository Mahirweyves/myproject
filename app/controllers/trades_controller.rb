class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /trades
  # GET /trades.json
  def index
    @categories = Category.all
  
    cate = params[:cate]

    if cate.present?
      @trades = Trade.where(:category_id => cate).paginate(:page => params[:page], per_page: 8).order('created_at desc')
    else
      @trades = Trade.paginate(:page => params[:page], per_page: 8).order('created_at desc')
    end  

    end


    def search
      @trades = Trade.where("title LIKE ?","%" + params[:q]+ "%").paginate(:page => params[:page], per_page: 8).order('created_at desc')
      @categories = Category.all
    end 

    # GET /trades/1
    # GET /trades/1.json
    def show
    @categories = Category.all
    end

    # GET /trades/new
    def new
      @trade = current_user.trades.build
      @categories = Category.all
    end

    # GET /trades/1/edit
    def edit
      @categories = Category.all
    end

    # POST /trades
    # POST /trades.json
     def create
      @trade = current_user.trades.build(trade_params)

      respond_to do |format|
        if @trade.save
          format.html { redirect_to @trade, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @trade }
        else
          format.html { render :new }
          format.json { render json: @trade.errors, status: :unprocessable_entity }
          @categories = Category.all
        end
      end
    end

    # PATCH/PUT /trades/1
    # PATCH/PUT /trades/1.json
    def update
      respond_to do |format|
        if @trade.update(trade_params)
          format.html { redirect_to @trade, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @trade }
        else
          format.html { render :edit }
          format.json { render json: @trade.errors, status: :unprocessable_entity }
        end
       end
    end

  
    # DELETE /trades/1
  
    # DELETE /trades/1.json
  
    # DELETE /trades/1
  # DELETE /trades/1.json
    def destroy
      @trade.destroy
      respond_to do |format|
        format.html { redirect_to trades_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
        @categories = Category.all
      end
    end
     

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_trade
        @trade = Trade.find(params[:id])
        @categories = Category.all

      end

    # Only allow a list of trusted parameters through.
      def trade_params
        params.require(:trade).permit(:title, :description, :category_id, :company_name, :price, :available_date, :link, :address, :telephone, :user_id, :name, images: [])
      end
end
