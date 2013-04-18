class DesignImage < ActiveRecord::Base

	belongs_to :user

  validates :user_id, :presence => true

  validates_format_of :content_type,
                      with: /^image/,
                      message: " you can only upload picture"

  def design_image=(picture_field)
    self.name = picture_field.original_filename
    self.content_type = picture_field.content_type.chomp
    self.data = picture_field.read
  end

end
