# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  #指定圖片壓縮程式
  include CarrierWave::MiniMagick

  #儲存方式
  storage :file
  # storage :fog  (存到Amazon S3雲端)

  #圖片存放路徑 (範例：~/projects/lab2/public/uploads/2015/11/xxx.jpg)
  def store_dir
    "uploads/#{model.created_at.year}/#{model.created_at.month}"
  end

  #將檔名更改為雜湊值 (避免上傳檔名重複，範例：f4445e4a4eca1f46284216dfa954da98.jpg)
  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

  #預設圖片 (當找不到圖片時就會用這張，檔案路徑： app/assets/images/default.jpg)
  def default_url
    'default.jpg'
  end

  #產生各種縮圖（大、中、小、縮圖）
  version :large do
    process :resize_to_fit => [800, 800]
  end
  version :medium do
    process :resize_to_fit => [400, 400]
  end
  version :small do
    process :resize_to_fit => [200, 200]
  end
  version :thumb do
    process :resize_to_fit => [60, 60]
  end

  #允許上傳圖片副檔名類型
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
