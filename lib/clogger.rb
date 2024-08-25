# lib/custom_logger.rb

require 'logger'

class Clogger
  @instance = nil

  # Ensure that the logger is only initialized once
  def self.instance
    @instance ||= new
  end

  private_class_method :new

  def initialize; end

  def info(message)
    Rails.logger.info(wrapped_message(message))
  end

  def warn(message)
    Rails.logger.warn(wrapped_message(message))
  end

  def error(message)
    Rails.logger.error(wrapped_message(message))
  end

  def debug(message)
    Rails.logger.debug(wrapped_message(message))
  end

  def fatal(message)
    Rails.logger.fatal(wrapped_message(message))
  end

  private

  def wrapped_message(message)
    "* CUSTOM LOGGER ====== #{message} ======= *"
  end
end
