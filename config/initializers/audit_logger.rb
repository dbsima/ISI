$AUDIT = ActiveSupport::TaggedLogging.new Logger.new(Rails.root.join('log/audit.log'))
