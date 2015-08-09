class User < ActiveRecord::Base
 	attr_accessor :password
	require 'bcrypt'

  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX 
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

	before_save :encrypt_password
	after_save :clear_password
	def encrypt_password
  		if password.present?
		  self.salt = BCrypt::Engine.generate_salt	
		  self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  		end
	end

	def clear_password
	  self.password = nil
	end

	def self.authenticate(username_or_email="", login_password="")
	  if  EMAIL_REGEX.match(username_or_email)    
	    user = User.find_by_email(username_or_email)
	  else
	    user = User.find_by_username(username_or_email)
	  end
	  if user && user.match_password(login_password)
	    return user
	  else
	    return false
	  end
	end   
	
	def match_password(login_password="")
	  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
	end

	def hasPrivilege(privilege)
		if self.role_id == 1
			return true
		elsif UserHasViewingPrivilege.where(:user_id => self.id, :viewingPrivilege_id => privilege).count > 0
			return true
		end
		return false
	end

	def hasPreference(preference)
		if ((UserHasViewingPreference.where(:user_id => self.id).count == 0) && preference.id == 1)
			return true
		elsif UserHasViewingPreference.where(:user_id => self.id, :viewingPreference_id => preference).count > 0
			return true
		end
		return false
	end
end