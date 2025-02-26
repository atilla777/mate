# frozen_string_literal: true

I18n.load_path += Dir[File.join(__dir__, 'locales', '*.{yml}')]

require_relative 'ui/helpers/icons'
require_relative 'ui/helpers/button'
require_relative 'ui/helpers/input'
require_relative 'ui/base'
require_relative 'ui/view/record_modal'

Dir[File.join(__dir__, '**', '*.rb')].sort.each do |file|
  require file
end
