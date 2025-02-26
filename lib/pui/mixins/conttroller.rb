# frozen_string_literal: true

module PUI
  module Mixins
    module Controller
      include ActionView::RecordIdentifier
      def index = render index_view
      def new = render turbo_stream: turbo_stream.update('record', new_view)
      def show = render turbo_stream: turbo_stream.update('record', show_view)
      def edit = render turbo_stream: turbo_stream.update('record', edit_view)

      def create
        @record = model.create(permitted_attributes)
        render_create_or_update
      end

      def update
        record.update(permitted_attributes)
        render_create_or_update
      end

      def destroy
        record.destroy

        render turbo_stream: turbo_stream.update(dom_id(model, :records_list), records_view)
      end

      private

      def model = raise NotImplementedError
      def menu_active_keys = raise NotImplementedError
      def menu_items = raise NotImplementedError

      def decorator_class = module_name('Decorator').constantize
      def records_view_class = "#{module_name('Component')}::Records".constantize
      def show_view_class = "#{module_name('Component')}::Show".constantize
      def index_view_class = "#{module_name('Component')}::Index".constantize
      def new_view_class = "#{module_name('Component')}::Edit".constantize
      def permitted_attributes = params.require(model.model_name.param_key).permit(permitted_attributes_keys)
      def module_name(type) = "#{model.name.deconstantize}::#{type}::#{model.name.demodulize}"

      def show_view = show_view_class.new(record:, params: pagination_params)
      def index_view = index_view_class.new(model:, records:, pagination_metadata:, q:, menu_items:)
      def new_view = new_view_class.new(record:, params: pagination_params)
      def edit_view = new_view
      def records_view = records_view_class.new(records:, model:, pagination_metadata:, q:)
      def records = paginated_records.map { decorator_class.new(it) }

      def record
        @record ||= params[:id] ? model.find(params[:id]) : model.new
      end

      def filter_params
        @filter_params ||= params.permit(q: {})[:q]
      end

      def sort_params
        @sort_params ||= params.permit(sort: {})[:sort]
      end

      def paginated_records = pagination_service.records
      def filtered_scope = filter_service.records
      def filter_service = PUI::Service::Scope::Filter.new(base_scope, filter_params)
      def q = filter_service.q
      def base_scope = model.all

      def pagination_service
        @pagination_service ||= PUI::Service::Scope::Paginator.new(
          filtered_scope,
          cursor: params[:cursor],
          direction: params[:direction],
          limit: params[:per_page]&.empty? ? nil : params[:per_page],
          skip_total:,
          filter_params:,
          sort_params:,
          force_first_page: %w[destroy update create].include?(action_name)
          # force_first_page: action_name == 'destroy' || (action_name == 'update' && sort_params[:column] != 'id')
        )
      end

      def skip_total = false
      def skip_count = false
      def pagination_metadata = pagination_service.metadata

      def pagination_params
        params.permit(:direction, :cursor, :per_page, q: {}, sort: {}).slice(*%w[direction cursor per_page q sort])
      end

      def render_create_or_update
        if record.errors.empty?
          render turbo_stream: turbo_stream.update(dom_id(model, :records_list), records_view)
        else
          render(turbo_stream: turbo_stream.update('record', edit_view, method: :morph), status: :unprocessable_entity)
        end
      end
    end
  end
end
