class User < ActiveRecord::Base

  has_many :links,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Link

  has_many :comments,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Comment

  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password
  after_initialize :ensure_session_token


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(128)
    self.save!
  end

end
