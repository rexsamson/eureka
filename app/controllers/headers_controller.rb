class HeadersController < ApplicationController
   
   def show
      @header = Header.find(params[:id])
   end
   
   def new 
     @header = Header.new
   end
   
   def create
      @header = Header.new(header_params)
      if 
      @header.save
      flash[:notice] = "Data created successfully!"
      redirect_to header_path(@header)
      else
         render 'new'
      end
   end
   
   private 
 
   def header_params
      params.require(:header).permit(:title, :header, :content, :footer, :note )
   end
   
   
end
