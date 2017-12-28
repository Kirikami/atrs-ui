class LoginPage < BasePage

  img :logo, class: 'image'
  text_field :email, id: 'LoginForm_email'
  text_field :password, id: 'LoginForm_password'
  link :forgot_password, id: 'LoginForm_forgotPassword'
  button :submit, id: 'LoginForm_submit'

  page_url CONF[:login_url]

  def login creds
      self.email = CONF[creds][:email]
      self.password = CONF[creds][:password]
      submit
  end

  def has_empty_credentials_error?
    wait_for_page_fully_loaded
    email_element.style == "rgba(159, 58, 56, 1)"
  end

end