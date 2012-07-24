# http://www.dzone.com/snippets/ruby-open-file-write-it-and
# http://www.ruby-doc.org/core-1.9.3/Hash.html
# http://rails-bestpractices.com/posts/47-fetch-current-user-in-models
# http://stackoverflow.com/questions/5226946/rails3-http-user-agent
# https://github.com/arsduo/koala/wiki/OAuth
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_flash_from_params
  before_filter :set_locale
  
protected
  def set_current_user
    User.current = current_user
  end
  def set_flash_from_params
    if params[:flash]
      params[:flash].each do |key, message|
        if message.include? 'notices'
          I18n.locale = cookies[:locale]
          flash.now[key.to_sym] = I18n.t(message)
        else
          flash.now[key.to_sym] = message
        end
      end
    end
  end

  def set_locale
    @@oauth = Koala::Facebook::OAuth.new(255900427854057, '8efe989aeb23f1206c40362da5795ba0', 'http://adopt-a-hydrant-syracuse.herokuapp.com/')
    if request.env['HTTP_USER_AGENT'].include? 'Mobi'
      session[:url_for_oauth_code] = @@oauth.url_for_oauth_code(:permissions=>'publish_stream', :permissions=>'email', :callback_url=>'http://adopt-a-hydrant-syracuse.herokuapp.com/', :display=>'touch')
    else
      session[:url_for_oauth_code] = @@oauth.url_for_oauth_code(:permissions=>'publish_stream', :permissions=>'email', :callback_url=>'http://adopt-a-hydrant-syracuse.herokuapp.com/')
    end
    
    available_languages = Dir.glob(Rails.root + 'config/locales/??.yml').map do |file|
      File.basename(file, '.yml')
    end
    
    !params[:locale].nil? ? uri_slice = params[:locale].slice(0..1) : nil
    (uri_slice == 'ar') || (uri_slice == 'cn') || (uri_slice == 'de') || (uri_slice == 'en') || (uri_slice == 'es') || (uri_slice == 'fr') || (uri_slice == 'gr') || (uri_slice == 'ht') || (uri_slice == 'he') || (uri_slice == 'it') || (uri_slice == 'kr') || (uri_slice == 'pl') || (uri_slice == 'pt') || (uri_slice == 'ru') || (uri_slice == 'yi') ? locale_token_in_uri = true : nil
    
    !params[:locale].nil? && params[:locale].slice(2..params[:locale].length).length > 0 ? Referral.resolve_token(params[:locale].slice(2..params[:locale].length)) : nil
    
    locale_token_in_uri ? cookies[:locale] = uri_slice : nil
    
    I18n.locale = cookies[:locale] || I18n.default_locale
  end
end