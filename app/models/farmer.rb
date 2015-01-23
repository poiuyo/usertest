class Farmer < ActiveRecord::Base
   
  validates :password, :presence=> true
  validates :password, :length=>{:in=> 5..200}
  validates :name, :email, :presence=> true
  validates :email, :uniqueness =>{:case_sensitive => false}
  validates :email, :format => {:with=> /@/, :messages=>" is invalid"}
  
  def password
   password_hash ? @password ||= BCrypt::Password.new(password_hash) :nil
   #if (password_hash)
   #  @password ||= BCrypt::Password.new(password_hash)
   #else 
   #  nil
   
  end
  
  def password=(new_password)
    @password= BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
  
  def self.authenticate(email, test_password)
    farmer= Farmer.find_by_email(email)
    if farmer && farmer.password == test_password
      farmer
    else nil
    end
  end
  
end
