class CharacterTag < ActiveRecord::Base
  belongs_to :relationshipType
  has_many :groupHasCharacters
  has_many :groups, :through => :groupHasCharacters

end
