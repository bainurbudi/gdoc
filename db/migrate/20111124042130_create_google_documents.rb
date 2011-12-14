class CreateGoogleDocuments < ActiveRecord::Migration
  def change
    create_table :google_documents do |t|
      t.string :file_url, :name, :google_doc_url, :permission      
      t.timestamps
    end
  end
end
