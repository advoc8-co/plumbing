require "test_helper"

class AuditLogTest < ActiveSupport::TestCase
  def setup
    super # initialize Current otherwise next line will fail
    @audit_log = create(:audit_log)
  end

  setup do
  end

  test "valid fixture" do
    assert @audit_log.valid?
  end

  test "log for tenanted create" do
    create(:post)
    assert_equal(1, AuditLog.count)
    assert_equal "create", AuditLog.last.action
  end

  test "log for tenanted update" do
    post = create(:post)
    post.update! title: "new title"
    assert_equal "update", AuditLog.last.action
    assert AuditLog.last.changelog.starts_with? "Not recorded"
  end

  test "log for tenanted destroy" do
    post = create(:post)
    post.destroy!
    assert_equal(2, AuditLog.count)
    assert_equal "destroy", AuditLog.last.action
  end

  # TODO: test untenanted create
end
