class Exam < ActiveRecord::Base
  has_attached_file :exam_file, styles: { thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :exam_file, content_type: /\Aimage\/.*\Z/
  belongs_to :course

  enum language: {
    finnish: 0,
    swedish: 1,
    english: 2
  }

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
