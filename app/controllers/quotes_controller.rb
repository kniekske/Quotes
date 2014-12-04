class QuotesController < ApplicationController

    def index
      @quotes = Quotes.find(:all) rescue nil
      # my_record = Record.find(params[:id) 
	end
   	
   	def show
      @quote = Quote.find(params[:id])rescue nil
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
      if @quote.update_attributes(params[:quote])
         redirect_to :action => 'show', :id => @quote
      else
         @quotes = Quote.find(:all)
         render :action => 'edit'
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
     		format.html { redirect_to expenses_url, notice: 'Quote was successfully destroyed.' }
      		format.json { head :no_content }
    	end
 	end

private

  def quote_params
    params.require(:quote).permit(:quote, :author, :image)
  end

end
