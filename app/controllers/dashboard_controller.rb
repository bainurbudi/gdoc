class  DashboardController < ApplicationController
  before_filter :authenticate_google, :only => [:index, :embed_files]

  def index    
    @folders = @service.folders
  end

  def embed_files
    @files = @service.files
  end

  def upload
    name = params[:file].original_filename
    directory = "public/"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write( params[:file].read) }
    gdoc = GoogleDocument.new(:name => name, :permission => "owner")
    #begin
      url = gdoc.upload_doc("public/#{name}")
    #rescue
      #render :text => "File format is not supported !!"
    #end

    unless url.blank?
      gdoc.save
      gdoc.update_attributes(:file_url => "public/#{name}", :google_doc_url => url)
    end
    
  end

  def upload_folder
    name = params[:file].original_filename
    directory = "public/"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write( params[:file].read) }
    gdoc = GoogleDocument.new(:name => name, :permission => "owner")
   # begin
      url = gdoc.upload_to_folder("public/#{name}",params[:folder])
    #rescue
    #  render :text => "File format is not supported !!"
    #end

    unless url.blank?
      gdoc.save
      gdoc.update_attributes(:file_url => "public/#{name}", :google_doc_url => url)
    end
    render :text => "Upload Successfull !!"
  end

  def upload_urls
    base_name = File.basename(params[:url])
    gdoc = GoogleDocument.new(:name => base_name, :permission => "owner")
    begin
      url = gdoc.upload_doc_url(params[:url])
    rescue
      render :text => "File format is not supported !!"
    end
    if url
      gdoc.save
      gdoc.update_attributes(:file_url => params[:url], :google_doc_url => url)
      flash[:notice] = "upload succesfull"
      redirect_to root_path
    else
      flash[:notice] = "upload failed"
      redirect_to root_path
    end
  end

  private

  def authenticate_google
    @service  = GDocs4Ruby::Service.new
    @service.authenticate(GOOGLE_USER,GOOGLE_PWD)
  end
end