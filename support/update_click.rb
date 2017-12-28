require 'watir-scroll'

module Watir

  #
  # Base class for HTML elements.
  # Updated method with monkey patching
  # Wait for ajax after each click
  #

  class Element

    def click(*modifiers)
      element_call(:wait_for_enabled) do
        if modifiers.any?
          action = driver.action
          modifiers.each { |mod| action.key_down mod }
          action.click @element
          modifiers.each { |mod| action.key_up mod }

          action.perform
        else
          @element.click
        end
      end
      wait_for_page_fully_loaded
      browser.after_hooks.run
    end

  end
end

