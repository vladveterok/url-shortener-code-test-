class FileManager
  DIR = Rails.root.join('tmp/store')
  FILE_PATH = "#{DIR}/links.yml".freeze

  def initialize(db_file_path = FILE_PATH)
    @db_file_path = db_file_path
  end

  def load
    File.open(FILE_PATH, 'r') do |file|
      YAML.load_stream(file)
    end
  end

  def save(object)
    create_directory(DIR) unless Dir.exist?(DIR)
    File.open(FILE_PATH, 'a') { |file| file.write(object.to_yaml) }
  end

  def create_directory(path)
    Dir.mkdir(path)
  end
end
