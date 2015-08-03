class Group < ActiveRecord::Base
  belongs_to :chunk
  belongs_to :parentGroup
  has_many :storylineTag
  has_many :groupHasCharacters, :class_name=>"GroupHasCharacter"
  has_many :characterTags, :through => :groupHasCharacters
  belongs_to :era
  belongs_to :detailLevel


  def sync_character_tags(group_id, selectedCharactersTags)
    @characters = CharacterTag.all

    @groupAlreadyHasCharacters = GroupHasCharacter.where(:group_id => group_id)  

    @selectedCharacterIds = selectedCharactersTags

    puts @selectedCharacterIds
    @selectedCharacterIds.pop
    @selectedCharacters = CharacterTag.find(@selectedCharacterIds)
    puts "sync up character tags"
    @characters.each do |character |
      puts character.id
      if(selection_has_character?(character))
        puts "character selected"
        @groupCharacter = GroupHasCharacter.where(:group_id => group_id, :characterTag_id => character.id).first_or_create
        @groupCharacter.save
      elsif(group_has_character?(character))
        @groupCharacter = GroupHasCharacter.where(:group_id => group_id, :characterTag_id => character.id).first
        @groupCharacter.destroy
        puts "character not selected"
      end

    end
  end

  def getDate
  	if self.contentDate != nil
  		@date = self.contentDate
  	else
  		if (self.age.to_i > 0)
  		puts self.age
  		puts "hmm"
  		@date = DateTime.parse("1989-7-14") + self.age.to_i.years
  		@date = @date.strftime("%F")
  	elsif self.era != nil
  		@date = self.era.read_attribute(:startDate)
  	else
  		@date = DateTime.parse("1989-7-14")
  		@date = @date.strftime("%F")
  	end
  end
  	return @date
  end

  def getDatePercision
  	if self.contentDate != nil
  		@date = self.contentDate
  	else
  		if (self.age.to_i != 0)
  		puts self.age
  		@date = DateTime.parse("1989-7-14") + self.age.to_i.years
   	elsif self.era != nil
  		@date = self.era.read_attribute(:startDate)
  	else
  		@date = DateTime.parse("1989-7-14")
  	end
  end
  	return @date + self.order.to_i.minutes
  end

  def getOrder
  	if self.order != nil
  		return self.read_attribute(:order)
  	else
  		return 0
  	end
  end

  def userHasAccess(current_user)
    @viewPrivileges = ViewingPrivilege.all
    @viewPrivileges.each do |viewing_privilege|
      if viewing_privilege.includes(self) && !current_user.hasPrivilege(viewing_privilege)
          return false
      end
    end
    return true
  end

  def hasStoryline(storyline)
    @storylines = GroupHasStoryline.where(:group_id => self.id)
    @storylines.each do |group_storyline|
        if group_storyline.storylineTag_id == storyline
          return true
        end
      end
      return false
  end

  def hasCharacter(character)
    @characters = GroupHasCharacter.where(:group_id => self.id)
    @characters.each do |group_character|
        if group_character.characterTag_id == character
          return true
        end
      end
      return false
  end

  def isIncludedInDateRange(startDate, endDate)
    if startDate == nil and endDate ==nil
      return true
    elsif startDate == nil and self.getDatePercision <= endDate
      return true
    elsif startDate <= self.getDatePercision and endDate == nil
      return true
    elsif startDate <= self.getDatePercision and  self.getDatePercision <= endDate
      return true
    else
      return false
    end
  end

end
