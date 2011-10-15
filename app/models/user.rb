class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_many :memberships, foreign_key: :member_id
  has_many :groups, through: :memberships

  has_many :created_groups, class_name: 'Group', foreign_key: 'created_by_id'

  validates_presence_of :username

  scope :random, order('random()')
  scope :exclude, lambda {|users|
    if users.present?
      where('id not in(?)', users)
    else
      scoped
    end
  }

  def role_symbols
    [:user]
  end
end
