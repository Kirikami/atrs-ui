require 'spec_helper'
require_relative '../support/config_helper'
require_relative '../config/initializers/page_loading'

class BasePage
  include PageObject
  include PageLoading
  ENV = :local
  CONF = get_config[ENV]

end