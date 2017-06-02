class Tournament < ActiveRecord::Base
  enum statuses: %i[
    joinable
    started
    complete
  ]

  scope :joinable, (lambda {
    where(status: Tournament.statuses[:joinable])
  })
  scope :started, (lambda {
    where(status: Tournament.statuses[:started])
  })
  scope :complete, (lambda {
    where(status: Tournament.statuses[:complete])
  })
end
