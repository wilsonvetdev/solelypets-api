class User < ApplicationRecord
    has_many :comments 
    has_many :donations

    has_secure_password
end
