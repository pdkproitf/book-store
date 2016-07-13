class CustomFailure < Devise::FailureApp
  def redirect_url
    session[:previous_url]
  end

  def respond
    if http_auth?
      http_auth
    else
      flash[:alert] = I18n.t(:not_found_in_database, :scope => [:devise, :failure])
      redirect
    end
  end
end
