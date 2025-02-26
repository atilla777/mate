# frozen_string_literal: true

# How to use (later it will be removed to PUI gem) - create config/initializers/pui.rb with:
# require_relative '../../lib/pui/pui'
#
# Rails.application.config.importmap.paths << Rails.root.join('lib', 'pui', 'config', 'importmap.rb')
# Rails.application.config.assets.paths << Rails.root.join('lib', 'pui', 'javascript')
#
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'PUI'
# end
#
# FYI
# It will load controllers from lib/pui/javascript/controllers
# via `pin_all_from File.expand_path('../javascript/controllers', __dir__), under: 'controllers')`
# in lib/pui/config/import
# and connect them to app
# via `eagerLoadControllersFrom("controllers", application)` in app/javascript/controllers/index.js

I18n.load_path += Dir[File.join(__dir__, 'locales', '*.{yml}')]

require_relative 'ui/helper/path'
require_relative 'ui/helper/icons'
require_relative 'ui/helper/buttons'
require_relative 'ui/helper/inputs'
require_relative 'ui/base'
require_relative 'ui/page/records'
require_relative 'ui/page/record_modal'

Dir[File.join(__dir__, '**', '*.rb')].sort.each do |file|
  next if file.include?('config')

  require file
end
