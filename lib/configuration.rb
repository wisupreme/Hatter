require 'configtoolkit'
require 'configtoolkit/keyvaluereader'
require 'relative'

class Configuration < ConfigToolkit::BaseConfig

  include Singleton

  CONFIG_FILE = File.expand_path_relative_to_caller("../hatterrc")

  def initialize(config_file = CONFIG_FILE)
    reader = ConfigToolkit::KeyValueReader.new config_file
    load reader
  end

  class Colors < ConfigToolkit::BaseConfig
    add_required_param(:foreground, String)
    add_required_param(:background, String)
  end

  add_required_param(:maildir, String)
  add_required_param(:maildir_format, String)
  add_required_param(:termbox_library_path, String)
  add_required_param(:colors, Colors)
end
