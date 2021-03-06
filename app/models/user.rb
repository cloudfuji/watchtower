class User < ActiveRecord::Base
  def cloudfuji_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
    self.locale     = extra_attributes["locale"]
    self.timezone   = extra_attributes["timezone"]
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cloudfuji_authenticatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :ido_id, :first_name, :last_name
end
