# frozen_string_literal: true

module PUI
  module Service
    module Menu
      class Root
        class_attribute :items

        def self.item(**args)
          item = Item.new(**args)
          self.items ||= []
          items << item
          yield(item) if block_given?
        end

        attr_reader :package, :model, :active_keys

        def initialize(active_keys:)
          @active_keys = active_keys
          items.each { it.prepare(self) }
        end

        def current_children
          @current_children ||= begin
                                  current_root = items.find { active_keys.include?(it.key) }
                                  current_root.items
                                end
        end
      end
    end
  end
end
