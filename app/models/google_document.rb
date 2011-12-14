require "gdocs4ruby"
require 'open-uri'
require 'pp'

class GoogleDocument < ActiveRecord::Base
  ####    
  #  This is how to do it
  #  1st create the dummy data
  #  GoogleDocument.insert_data
  #  
  #  and then create file named test.doc, and insert into public directory of your rails app
  #  
  #  1- upload local doc
  #  doc = GoogleDocument.first
  #  doc.upload_doc("public/test.doc")
  #  
  #  
  #  2- upload from url
  #     doc = GoogleDocument.first
  #     doc.upload_doc_url("http://ilmukomputer.org/wp-content/uploads/2011/09/how-to-make-iptv-network.doc")
  #  
  #  3- changing file permission
  #  doc = GoogleDocument.first
  #  doc.change_permission("dummy@41studio.com","viewer")
  #  
  #  4- embed url
  #  doc = GoogleDocument.first
  #  doc.embed_url
  #  
  #  5- check file / document
  #  doc.file_or_document?
  #  
  #  6- share with others
  #  doc = GoogleDocument.first
  #  doc.share_with_email("test@test.com","viewer")
  #  ####
  
  def self.insert_data
    GoogleDocument.find_or_create_by_name(:name => "test.doc", :permission => "owner")
  end
  
  def upload_doc(file_location)
    doc = upload_local_file(file_location)
    return doc.html_uri
    #will upload the document from file location 'file'
  end
  
  def upload_local_file(file_location)
    service = authenticate_google_user("dummy@41studio.com", "ssstsecret")
    ext_name = File.extname(file_location)[1..-1]
    
    name = File.basename(file_location)    
    doc = GDocs4Ruby::Document.new(service)
    doc.title = name
    doc.local_file = file_location    
    doc.content_type = ext_name
    doc.save
    return doc
  end
  
  def authenticate_google_user(user, pwd)
    service  = GDocs4Ruby::Service.new    
    service.authenticate(user, pwd)
    return service
  end

  def upload_doc_url(url_location)
    #this will fetch the file from URL and upload to google docs
    # dowload the file to local 1st
    base_name = File.basename(url_location)    
    path_file = "public/#{base_name}"
    write_out = open(path_file, "wb")
    write_out.write(open(url_location).read)
    write_out.close
    
    #upload to google docs
    doc =  upload_doc(path_file)
    File.delete(path_file) #delete the files
    return doc
  end

  def change_permission(email, rule)
    #changes the permission of the google doc
    ## rule can be 'viewer' or 'owner'
    find_google_doc_by_name.each do |perm|
      perm.update_access_rule(email, rule)
    end    
  end
  
  def find_google_doc_by_name
    service = authenticate_google_user("dummy@41studio.com", "ssstsecret")    
    ## search the document base on name on the row
    doc = GDocs4Ruby::Document.find(service, {'title' => name})    
    return doc.to_a #convert it to array
  end

  def embed_url
    #return the URL to use for embed view or google doc viewer
    "http://docs.google.com/gview?url=#{find_google_doc_by_name.first.html_uri}"
  end

  def file_or_document?
    #returns whether the GoogleDocument instance is a file (ie stored as native file) or a Google Document format (can be edited)
    # type =  ["document", "folder", "spreadsheet", "presentation", "any"]
    doc = find_google_doc_by_name.first
    if doc.blank?
      return false
    else
      case doc.type
      when "document"
        return true
      when "spreadsheet"
        return true
      when "presentation"
        return true
      when "any"
        return false
      end
    end    
  end

  def upload_to_folder(file_location, folder_name)
    service = authenticate_google_user("dummy@41studio.com", "ssstsecret")
    ext_name = File.extname(file_location)[1..-1]
    folder_tmp = ""
    service.folders.each do |folder|
      if folder.title == folder_name
        folder_tmp = folder
      end
    end
    name = File.basename(file_location)
    doc = GDocs4Ruby::Document.new(service)
    doc.title = name
    doc.local_file = file_location
    doc.content_type = ext_name
    doc.add_to_folder(folder_tmp)
  end

  def share_with_email(email, permission)
    doc = find_google_doc_by_name
    doc.add_access_rule(email, permission)
    return doc
    #shares the document with the user with email
  end
end

## file type support
# UPLOAD_TYPES = {'' => 'text/txt',
#                :csv => 'text/csv',
#                :tsv => 'text/tab-separated-values',
#                :tab => 'text/tab-separated-values',
#                :html => 'text/html',
#                :htm => 'text/html',
#                :doc => 'application/msword',
#                :docx => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
#                :ods => 'application/x-vnd.oasis.opendocument.spreadsheet',
#                :odt => 'application/vnd.oasis.opendocument.text',
#                :rtf => 'application/rtf',
#                :sxw => 'application/vnd.sun.xml.writer',
#                :txt => 'text/plain',
#                :xls => 'application/vnd.ms-excel',
#                :xlsx => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
#                :pdf => 'application/pdf',
#                :ppt => 'application/vnd.ms-powerpoint',
#                :pps => 'application/vnd.ms-powerpoint',
#                :pptx => 'application/vnd.ms-powerpoint'}
