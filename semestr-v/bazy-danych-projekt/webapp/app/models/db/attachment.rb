class Java::Db::Attachment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Db::Base

  extend CarrierWave::Mount

  mount_uploader :file, ::AttachmentUploader

  def read_uploader(name)
    Rails.logger.debug "read_uploader(#{name})"
    @file
  end

  def write_uploader(name, value)
    Rails.logger.debug "write_uploader(#{name}, #{value})"
    # @file = value
    self.set_file(value)
    # instance_variable_set(:"@#{name}", value)
  end

  def file=(new_file)
    Rails.logger.debug new_file
    super
  end

  def file_url
    "/uploads/java/db/attachment/file/#{id}/#{get_file}"
  end
end
