class HeadersController < ApplicationController
   
   def show
      @header = Header.find(params[:id])
   end
   
   def edit
      @header = Header.find(params[:id])
   end
   
   def new 
     @header = Header.new
   end
   
   def create
      @header = Header.new(header_params)
      if @header.save
         flash[:notice] = "Data created successfully!"
         redirect_to header_path(@header)
      else
         render 'new'
      end
   end
   
   def update
      @header = Header.find(params[:id])
      if @header.update(header_params)
         flash[:notice] = "Data updated"
         redirect_to header_path(@header)
      else
         render 'edit'
      end
         
   end
   
   private 
 
   def header_params
      params.require(:header).permit(:title, :header, :content, :footer, :note )
   end
   
   
end
