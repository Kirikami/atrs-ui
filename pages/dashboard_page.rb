class DashboardPage < BasePage

  img :logo, class: 'circular'
  link :logout, css: 'a'

  def has_logo?
    wait_for_page_fully_loaded
    logo_element.exist? && logo_element.visible?
  end
end