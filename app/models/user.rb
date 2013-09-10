class User < ActiveRecord::Base
#  devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :name, :email, :id, :password, :password_confirmation
  validates :name, :email , :presence => true 
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  before_save :encrypt_password
#   after_save :clear_password
#  validates :password, :length => { :minimum => 5, :maximum => 40 },
#                      :confirmation =>true
#  validates_confirmation_of :password
  require 'digest/md5'  
   def self.authenticate(username, password)
#     users = User.select('id,name,email').where(:name=> username, :password=> Digest::MD5.hexdigest(password))
     pass = Digest::MD5.hexdigest(password)
          check = User.find_by_name_and_password(username,pass)
   end
   
  validates_presence_of :password_confirmation,:on => :create, :if => :password_present?
    validates_confirmation_of :password ,:on => :create, :if => :password_present?
    
    def password_present?
      !password.nil?
    end
    
    
#    def valid_password
#        if password.blank? || password_confirmation.blank?
#          errors.add(:password, 'password must not be blank')
#        end
#    
#        if password != password_confirmation
#          errors.add(:password, 'password and confirmation does not match')
#        end
#      end
#    
   
    def encrypt_password
        if password.present?
          require 'digest/md5'
          self.password = Digest::MD5.hexdigest(self.password)
        end
     end
      
      def clear_password
        self.password = nil
      end

   
end