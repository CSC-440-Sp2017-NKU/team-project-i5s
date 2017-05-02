class UserFile < ApplicationRecord
  belongs_to :user
  
  #TODO help!
  def uploaded_file=(incoming_file)
    self.resource_text = incoming_file.original_filename
    #self.content_type = incoming_file.content_type
    self.attached_file = incoming_file.read
    self.user_id = user_id
    #self.created_at = 
  end

  def resource_text=(new_resource_text)
    write_attribute("resource_text", sanitize_resource_text(new_resource_text))
  end

  private
  def sanitize_resource_text(resource_text)
    #get only the filename, not the whole path (from IE)
    just_resource_text = File.basename(resource_text)
    #replace all non-alphanumeric, underscore or periods with underscores
    just_resource_text.gsub(/[^\w\.\-]/, '_')
  end
end
