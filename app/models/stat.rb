class Stat < ActiveRecord::Base
  attr_accessible :browser, :from, :ip, :os

  validates :session_id, :uniqueness => true
  validates :session_id, :presence => true
  
  def self.add(request)
  	user_stat = Stat.new
  	user_stat.ip = get_user_ip(request)
  	user_stat.from = get_user_from(request)
  	user_stat.os = get_user_os(request)
  	user_stat.browser = get_user_browser(request)
    user_stat.session_id = request.session_options[:id]

  	unless user_stat.ip == "127.0.0.1" or user_stat.ip == "localhost"
  		user_stat.save
  	end
  end

  def self.get_user_ip(request)
    request.remote_ip
  end

  def self.get_user_from(request)
    request.env["HTTP_REFERER"]
  end

  def self.get_user_os(request)
    if request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
      "Mac"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
      "Windows"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
      "Linux"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/unix/i)
      "Unix"
    else
      "Unknown"
    end
  end

  def self.get_user_browser(request)
    user_agent =  request.env['HTTP_USER_AGENT'].downcase 
    @users_browser ||= begin
      if user_agent.index('msie') && !user_agent.index('opera') && !user_agent.index('webtv')
                    'ie'+user_agent[user_agent.index('msie')+5].chr
        elsif user_agent.index('gecko/')
            'gecko'
        elsif user_agent.index('opera')
            'opera'
        elsif user_agent.index('konqueror')
            'konqueror'
        elsif user_agent.index('ipod')
            'ipod'
        elsif user_agent.index('ipad')
            'ipad'
        elsif user_agent.index('iphone')
            'iphone'
        elsif user_agent.index('chrome/')
            'chrome'
        elsif user_agent.index('applewebkit/')
            'safari'
        elsif user_agent.index('googlebot/')
            'googlebot'
        elsif user_agent.index('msnbot')
            'msnbot'
        elsif user_agent.index('yahoo! slurp')
            'yahoobot'
        #Everything thinks it's mozilla, so this goes last
        elsif user_agent.index('mozilla/')
            'gecko'
        else
            'unknown'
        end
        end

        return @users_browser
  end
end
