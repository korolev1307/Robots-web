class Good < ApplicationRecord
	belongs_to :good_category, optional: true
  belongs_to :order_good
	
	has_attached_file :photo, :styles => { index: '256x192!', show: '512x384!' }, :default_url => "/images/:style/any.png", 
	  path: :path_filename_partition,
      url: :url_filename_partition
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\z/

  def path_filename_partition
    ":rails_root/public/system/:class/:attachment/:style/:filename"
  end

  def url_filename_partition
    "/system/:class/:attachment/:style/:filename"
  end
end
