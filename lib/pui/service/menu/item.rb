module PUI
  module Service
    module Menu
      class Item
        class ItemArgumentError < StandardError; end

        attr_accessor :root

        attr_reader :key, :model, :title, :parent_key, :items

        def initialize(item)
          raise ItemArgumentError unless item[:key].is_a?(Symbol)

          @key = item[:key]
          @model = item[:model] || item[:key].to_s.camelize.safe_constantize
          @title = item[:title] || model.model_name_human_plural
          @initial_url = item[:url]
          @parent_key = item[:parent_key]
          @items = []
        end

        def item(...) = items << Item.new(...)

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
                     Rails.application.routes.url_helpers.polymorphic_url(model, only_path: true)
                   else
                     items.first&.url
                   end
                 end
        end

        private

        attr_reader :initial_url
      end
    end
  end
end
