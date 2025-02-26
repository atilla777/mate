# frozen_string_literal: true

require_relative '../../lib/fap/fap'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'FAP'
end
