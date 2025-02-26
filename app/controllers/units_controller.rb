# frozen_string_literal: true

class UnitsController < ApplicationController
  def index = render Views::Unit::Index.new(model:, records:)

  def new
    render turbo_stream: turbo_stream.update("record-form", Views::Unit::Edit.new(record:))
  end

  def edit
    render turbo_stream: turbo_stream.update("record-form", Views::Unit::Edit.new(record:))
  end

  def create
    record = model.create(permitted_attributes)

    if record.errors.empty?
      render turbo_stream: turbo_stream.update(
        "records-list",
        Views::Unit::Records.new(records:, model:),
        method: :morph
      )
    else
      render(turbo_stream: turbo_stream.update(
        "record-form", Views::Unit::Edit.new(record:),
        method: :morph
        ),
       status: :unprocessable_entity
      )
    end
  end

  def update
    if record.update(permitted_attributes)
      render turbo_stream: turbo_stream.update(
        "records-list",
        Views::Unit::Records.new(records:, model:),
        method: :morph
      )
    else
      render(turbo_stream: turbo_stream.update(
        "record-form", Views::Unit::Edit.new(record:),
        method: :morph
        ),
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    record.destroy

    render turbo_stream: turbo_stream.update(
      "records-list",
      Views::Unit::Records.new(records:, model:),
      method: :morph
    )
  end

  private

  def model = Unit
  def permitted_attributes = params.require(:unit).permit(%i[name kind description])
  def records = model.all.decorate(decorator_class)
  def record
    @record ||= params[:id] ? model.find(params[:id]) : model.new
  end
  def decorator_class = UnitDecorator
end
