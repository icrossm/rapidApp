class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,:omniauth_providers => [:facebook, :twitter]
         
          attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid

         has_many :authentications
         
        has_many :friends, :dependent => :destroy
        
         has_many :debts
         def apply_omniauth(omniauth)
           # self.email = omniauth['user_info']['email'] if email.blank?
#            authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
authentications.build(:provider => omni['provider'], 
                      :uid => omni['uid'], 
                       :token => omni['credentials'].token, 
                      :token_secret => omni['credentials'].secret)
         end

         def password_required?
           (authentications.empty? || !password.blank?) && super
         end
         
         def update_with_password(params, *options)
          if encrypted_password.blank?
          update_attributes(params, *options)
          else
          super
          end
         end
         
         # def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
#  
#            user = User.where(:provider => auth.provider, :uid => auth.uid).first
#            if user
#              return user
#            else
#              registered_user = User.where(:email => auth.uid + "@twitter.com").first
#              if registered_user
#                return registered_user
#              else
#                user = User.create(name:auth.info.name,
#                  provider:auth.provider,
#                  uid:auth.uid,
#                  email:auth.uid+"@twitter.com",
#                  password:Devise.friendly_token[0,20],
#                )
#              end
#            end
#          end
end


