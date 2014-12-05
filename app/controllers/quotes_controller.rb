class QuotesController < ApplicationController

    def index
      @quotes = Quote.all
    end
   	
   	def show
      @quote = Quote.find(params[:id])
   	end

    def random
      @quote = Quote.order("RAND()").first
    end

   	

   	def new
      @quote = Quote.new
   	end
   
   	def create


    @quote = Quote.new(quote_params)   
      # @quote = Quote.new(params[:quote])
      if @quote.save
            redirect_to :action => 'index'
      else
            @quotes = Quote.find(:all)
            render :action => 'new'
      end
   end

   def edit
      @quote = Quote.find(params[:id])
   end

   def update
      @quote = Quote.find(params[:id])
		if @quote.update(quote_params)
			redirect_to quotes_path
		else
			render 'edit'
		end
	end

   def delete
      @quote = Quote.find(params[:id])
      @expense.delete
      redirect_to :action => 'index'
   end


	def destroy
		@quote = Quote.find(params[:id])
    	@quote.destroy
    	respond_to do |format|
     		format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      		format.json { head :no_content }
    	end
 	end

private

  def quote_params
    params.require(:quote).permit(:quote, :author, :image)
  end

end
