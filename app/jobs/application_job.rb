# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  def perform(*_args)
    raise NotImplementedError, "You must implement the perform method in #{self.class.name}"
  end
end
