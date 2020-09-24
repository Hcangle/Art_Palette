class User < ActiveRecord::Base
 has_many :supplies
 has_secure_password
end 