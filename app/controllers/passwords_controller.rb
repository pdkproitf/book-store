class PasswordsController < Devise::PasswordsController
  #protected
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with({}, location: not_exist_email(resource_name))
    end
  end

  def not_exist_email(resource_name)
    flash[:alert] = I18n.t(:not_exist_email, :scope => [:devise, :failure])
    session[:previous_url]
  end
end
