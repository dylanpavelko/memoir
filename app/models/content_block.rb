class ContentBlock < ActiveRecord::Base
  belongs_to :contentType
  belongs_to :style
end
