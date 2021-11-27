class JsonWebToken
  SECRET_KEY = "b8ffada69bf4af0f1056ed182326ec10c4790b16d84662415126504fc2e62773f2d2bc0bcd7d1c561c4e244925d9f9198ae0a0bdeed1ffdfafdfbeaaa71a136c"

  def self.expiry_time
    24.hours.from_now
  end

  def self.refresh_expiry_time
    3.days.from_now
  end

  def self.encode(payload, expiration = self.expiry_time)

    payload[:exp] = expiration.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end