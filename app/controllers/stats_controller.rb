class StatsController < ApplicationController
  # GET /stats
  # GET /stats.json
  def index
    @stats = Stat.order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stats }
    end
  end

  # GET /stats/new
  # GET /stats/new.json
  def new
    @stat = Stat.new(ip: get_user_ip, os: get_user_os, browser: get_user_browser, from: get_user_from)
    @stat.save!
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(params[:stat])

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "new" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_user_ip
    UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
  end

  def get_user_from
    request.env["HTTP_REFERER"]
  end

  def get_user_os
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

  def get_user_browser
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
