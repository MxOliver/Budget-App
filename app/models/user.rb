class User < ApplicationRecord
    has_many :expenses, dependent: :destroy

    before_save { self.username = username.downcase if username.present? }

    validates :username, length: { minimum: 3, maximum: 20 }, presence: true
    validates_uniqueness_of :username, uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: { minimum: 6}


    has_secure_password


end
