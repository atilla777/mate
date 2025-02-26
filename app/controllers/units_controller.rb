# frozen_string_literal: true

class UnitsController < ApplicationController
  def index = render Views::Unit::Index.new(model:, records:, pagination_metadata:, q:)

  def new
    render turbo_stream: turbo_stream.update(
      'record', Views::Unit::Edit.new(record:, params: pagination_params)
    )
  end

  def show
    render turbo_stream: turbo_stream.update('record', Views::Unit::Show.new(record:, params: pagination_params))
  end

  def edit
    render turbo_stream: turbo_stream.update(
      'record', Views::Unit::Edit.new(record:, params: pagination_params)
    )
  end

  def create
    record = model.create(permitted_attributes)

    if record.errors.empty?
      render turbo_stream: turbo_stream.update(
        'records-list',
        Views::Unit::Records.new(records:, model:, pagination_metadata:, q:)
      )
    else
      render(turbo_stream: turbo_stream.update(
        'record', Views::Unit::Edit.new(record:, params: pagination_params),
        method: :morph
        ),
       status: :unprocessable_entity
      )
    end
  end

  def update
    if record.update(permitted_attributes)
      render turbo_stream: turbo_stream.update(
        'records-list',
        Views::Unit::Records.new(records:, model:, pagination_metadata:, q:)
      )
    else
      render(turbo_stream: turbo_stream.update(
        'record', Views::Unit::Edit.new(record:, params:),
        method: :morph
        ),
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    record.destroy

    render turbo_stream: turbo_stream.update(
      'records-list',
      Views::Unit::Records.new(records:, model:, pagination_metadata: pagination_metadata, q:)
    )
  end

  private

  def model = Unit
  def permitted_attributes = params.require(:unit).permit(%i[name kind description])
  def records = paginated_records.map { decorator_class.new(it) }

  def record
    @record ||= params[:id] ? model.find(params[:id]) : model.new
  end
  def decorator_class = UnitDecorator

  def filter_params
    @filter_params ||= params.permit(q: {})[:q]
  end

  def sort_params
    @sort_params ||= params.permit(sort: {})[:sort]# &.deep_symbolize_keys
  end

  def paginated_records = pagination_service.records
  def filtered_scope = filter_service.records
  def filter_service = FAP::Filter.new(base_scope, filter_params)
  def q = filter_service.q
  def base_scope = model.all

  def pagination_service
    @pagination_service ||= FAP::Paginator::Service.new(
      filtered_scope,
      cursor: params[:cursor],
      direction: params[:direction],
      limit: params[:per_page]&.empty? ? nil : params[:per_page],
      skip_total:,
      filter_params:,
      sort_params:,
      force_first_page: action_name == 'destroy'
    )
  end

  def skip_total = false
  def pagination_metadata = pagination_service.metadata

  def pagination_params
    params.permit(:direction, :cursor, :per_page, q: {}, sort: {}).slice(*%w[direction cursor per_page q sort])
  end

  def skip_count = false
end
