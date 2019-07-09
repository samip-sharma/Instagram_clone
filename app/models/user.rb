  class User < ApplicationRecord
    has_many :photos
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    validates_uniqueness_of :user_name

    has_secure_password

    # def password=(plain_password)
    #   self.password_digest=BCrypt::Password.create(plain_password)
    # end
    #
    # def authenticate(plain_password)
    #   BCrypt::Password.new(self.password_digest)== plain_password
    # end

end
