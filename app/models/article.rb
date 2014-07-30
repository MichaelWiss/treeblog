class Article < ActiveRecord::Base
	belongs_to :author
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	has_many :featured


	has_attached_file :image,
	:storage => :s3,
    :s3_credentials => {
      :bucket => ENV['treeblog'],
      :access_key_id => ENV['AKIAJE56SC5HH3XW3VTA'],
      :secret_access_key => ENV['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']
    },
    :path => ":filename.:extension"

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

 
 
	


   def tag_list
       tags.join(", ")
    end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
