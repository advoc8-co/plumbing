# NOTE: I think audited is better than auditable as it always happens
module Audited
  extend ActiveSupport::Concern

  included do
    after_create :record_create
    after_update :record_update
    after_destroy :record_destroy
  end

  def record_create
    create("create")
  end

  def record_update
    create("update")
  end

  # TODO: soft delete...
  def record_destroy
    create("destroy")
  end

  private

  def create(action)
    AuditLog.create({
      user: Current.user,
      # TODO: confirm an untenanted model could be updated without Current.company
      company: Current&.company,
      action: action,
      model_class: self.class.name,
      model_id: id,
      changelog: changelog(action)
    })
  end

  # TODO: this could be cleverer - e.g. store before and after for strings
  def changelog(action)
    return nil unless action == "update"
    "Not recorded - implement custom changelog method in #{self.class.name}."
  end
end
