# frozen_string_literal: true

require_relative '../../lib/pui/pui'

Rails.application.config.importmap.paths << Rails.root.join('lib', 'pui', 'config', 'importmap.rb')
Rails.application.config.assets.paths << Rails.root.join('lib', 'pui', 'javascript')

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'PUI'
end
