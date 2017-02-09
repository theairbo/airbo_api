class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Response
  include ExceptionHandler

  before_action :authenticate

  private

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        # @current_user = User.find_by(api_key: token)
        @current_user = User.find_by(invitation_code: token)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Bad credentials', status: :unauthorized
    end
end
# curl -H "Authorization: Token token=nickweiland@gmail.com" http://localhost:3000/users/2212
