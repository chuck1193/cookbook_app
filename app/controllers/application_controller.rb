class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user #checking to see if someone is signed in
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]

      begin 
        decoded_token = JWT.decode(
                                    token,
                                    Rails.application.credentials.fetch(:secret_key_base),
                                    true,
                                    { algorithm: 'HS256'}
                                  )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end
  helper_method :current_user #helper method only works in an application controller so it is available in the views
end
