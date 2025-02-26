module PUI
  module Service
    module Menu
      class Item
        class ItemArgumentError < StandardError; end

        attr_accessor :root

        attr_reader :key, :model, :title, :items

        def initialize(parent_key = nil, item)
          raise ItemArgumentError unless item[:key].is_a?(Symbol)

          @parent_key = parent_key
          @key = item[:key]
          @package = item[:package]
          @model = prepare_model(item)

          @title = item[:title] || model.model_name_human_plural
          @initial_url = item[:url]
          @items = []
        end

        def item(args)
          items << Item.new(key, args)
        end

        def prepare(root)
          self.root = root
          items.each { it.prepare(root) }
        end

        def active? = root.active_keys.include?(key)

        def url
          return @url if defined?(@url)

          @url = begin
                   return initial_url if initial_url

                   if model
                     if package
                       Scan::Engine.routes.url_helpers.polymorphic_url(model, only_path: true)
                     else
                        Rails.application.routes.url_helpers.polymorphic_url(model, only_path: true)
                     end
                   else
                     items.first&.url
                   end
                 end
        end

        private

        def prepare_model(item)
          return item[:model] if item[:model]

          model = [ parent_key&.to_s&.camelize, item[:key].to_s.camelize ].compact.join('::').safe_constantize ||
            item[:key].to_s.camelize.safe_constantize

          model && model < ActiveRecord::Base ? model : nil
        end

        attr_reader :initial_url, :parent_key, :package
      end
    end
  end
end
