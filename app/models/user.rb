class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  enum role: { user: 'user', admin: 'admin' }

end
