class TumblrService < Service
  def self.handles?(uri)
    uri.host =~ /tumblr.com$/
  end
  
  def shortname
    :tumblr
  end
  
  def display_name
    "#{account} on Tumblr"
  end
  
  def account
    /^(?<account>\w+)\.tumblr.com/ =~ @uri.host
    account
  end
  
  private
  
  def fetch_details
    {
      :account => account,
    }
  end
end

Service.register(:tumblr, TumblrService)
