# frozen_string_literal: true

I18n.load_path += Dir[File.join(__dir__, 'locales', '*.{yml}')]

require_relative 'ui/helper/path'
require_relative 'ui/helper/icons'
require_relative 'ui/helper/buttons'
require_relative 'ui/helper/inputs'
require_relative 'ui/base'
require_relative 'ui/page/record_modal'

Dir[File.join(__dir__, '**', '*.rb')].sort.each do |file|
  require file
end
