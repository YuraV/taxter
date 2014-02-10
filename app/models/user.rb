class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :second_name, :birth_date
  # attr_accessible :title, :body
  after_create :set_default_role

  validates :email, :presence => true, :exclusion => {:in => %w(admin@mail.ru),
                                                      message: "%{value} is reserved."}
  validates :name, format: {with: /^[a-zA-Z0-9]+$/, message: "should have A-Z 0-9 format, no space"}
  validates :second_name, format: {with: /^[a-zA-Z0-9]+$/, message: "should have A-Z 0-9 format, no space"}

  validates_date :birth_date, :before => lambda { 18.years.ago },
                 :before_message => "must be at least 18 years old"
private
  def set_default_role
    add_role "User"
  end
end
