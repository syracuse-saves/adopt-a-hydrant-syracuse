# https://github.com/arsduo/koala/wiki/OAuth
# https://github.com/arsduo/koala/wiki/Graph-API
class MainController < ApplicationController
  before_filter :set_current_user
    
  def index
    ReferThis.url(params[:referral], User.current.id, request.base_url, User.current.name, 'Adopt-a-Hydrant') if !params[:referral].nil?
    @oauth = Koala::Facebook::OAuth.new(255900427854057, '8efe989aeb23f1206c40362da5795ba0', 'http://adopt-a-hydrant-syracuse.herokuapp.com/')
    session[:url_for_oauth_code] = @oauth.url_for_oauth_code(:permissions=>'publish_stream', :permissions=>'email', :callback_url=>'http://adopt-a-hydrant-syracuse.herokuapp.com/')
    if !request[:code].nil?
      @graph = Koala::Facebook::API.new(@oauth.get_access_token(request[:code]))
      profile = @graph.get_object('me')
      if User.exists?(:facebook_id=>profile['id'])
        user = User.find_by_facebook_id(profile['id'])
        user.name = profile['name']
        user.email = profile['email']
        user.save
        sign_in('user', user)
        User.current = User.find_by_facebook_id(profile['id'])
      else
        user = User.new1
        user.name = profile['name']
        user.facebook_id = profile['id']
        user.email = profile['email']
        user.save
        sign_in('user', user)
        User.current = user
      end
    end
    
    @required = Sidebar.translate_required if @required.nil?
    @sms_notifications = Sidebar.translate_sms_notifications if @sms_notifications.nil?
  end
end