class User < ApplicationRecord
    has_secure_password

    has_many :to_do_items
end
