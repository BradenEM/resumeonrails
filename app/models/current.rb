class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :session
  delegate :user, to: :session, allow_nil: true
end
