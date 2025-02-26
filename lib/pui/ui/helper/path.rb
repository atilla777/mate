# frozen_string_literal: true

module PUI
  module UI
    module Helper
      module Path
        private

        def path(record_or_model, **options)
          polymorphic_path([routes_proxy(record_or_model), record_or_model], **options)
        end

        def routes_proxy(record_or_model)
          engine = engine_method_name(record_or_model)

          if engine && respond_to?(engine)
            public_send(engine)
          else
            # just main_app not works here
            helpers.main_app
          end
        end

        def engine_method_name(record_or_model)
          if record_or_model.is_a?(ActiveRecord::Base)
            record_or_model.class.module_parent_name&.underscore
          elsif record_or_model.respond_to?(:__getobj__)
            record_or_model.__getobj__.class.module_parent_name&.underscore
          else
            record_or_model.module_parent_name&.underscore
          end
        end
      end
    end
  end
end
