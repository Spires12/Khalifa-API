class JsonWebToken
  SECRET_KEY = 'secret'  #Rails.application.secrets.secrets.secret_key_base.to_s

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, "SECRET_KEY")
  end
  
  def self.decode(token)
    decoded = (JWT.decode(token, "SECRET_KEY"))[0]
    p decoded['exp']
    p Time.now.to_i
    if decoded['exp'] >= Time.now.to_i
      HashWithIndifferentAccess.new decoded
    end  
  end 
end
