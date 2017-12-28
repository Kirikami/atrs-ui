require 'yaml'

def get_config
  YAML.load (File.open('./config/config.yml'))
end
