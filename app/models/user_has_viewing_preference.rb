class UserHasViewingPreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :viewingPreference
end
