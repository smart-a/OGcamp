class User < ApplicationRecord
    has_many :projects
    validates_presence_of(:fullname)
    validates_presence_of(:email) 
    validates_presence_of(:password)
end
