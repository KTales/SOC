class Tournament < ActiveRecord::Base
  has_many :players, dependent: :destroy
  has_many :matches, dependent: :destroy

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
