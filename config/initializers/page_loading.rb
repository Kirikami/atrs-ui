module PageLoading
  def page_fully_loaded?
    script = @browser.execute_script("return (document.readyState)")
    script == "loaded" || script == "complete"
  end

  def wait_for_page_fully_loaded(window = 1, global_timeout = 10)
    if global_timeout == 0
      raise "Timed out waiting for ajax requests to complete"
      return false
    end
    sleep window

    if not page_fully_loaded?
      wait_for_page_fully_loaded window, global_timeout-= 1
    else
      true
    end
  end
end
