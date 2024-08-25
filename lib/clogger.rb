# lib/custom_logger.rb

require 'singleton'
require 'logger'

class Clogger
  include Singleton

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
