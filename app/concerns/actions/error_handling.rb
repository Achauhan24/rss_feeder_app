# frozen_string_literal: true

module Actions
  module ErrorHandling
    def error_code
      @error_code ||= 400
    end

    def error_code=(status_code)
      @error_code = status_code
    end

    def errors
      @errors ||= {}
    end

    def success?
      errors.blank?
    end

    def error_messages
      error_messages_obj = errors.values.map do |error_object|
        if error_object.respond_to?(:full_messages)
          error_object.full_messages
        elsif error_object.is_a?(Hash)
          error_object.values
        elsif error_object.is_a?(Array) || error_object.is_a?(String)
          error_object
        end
      end
      flatten_errors error_messages_obj
    end

    def field_errors
      error_messages_obj = errors.values.map do |error_object|
        error_object.messages if error_object.respond_to?(:messages)
      end
      flatten_errors(error_messages_obj).each_with_object({}) { |obj, final_obj| final_obj.merge!(obj || {}) }
    end

    def error_response
      @error_response ||= {
        error_messages: error_messages,
        field_errors: field_errors
      }
    end

    private

    def not_found_error(klass_name, type, id)
      fail_with_error(422, type, "#{klass_name} could not be found with id=#{id}")
    end

    def flatten_errors(errors_obj)
      errors_obj.flatten.compact
    end

    def fail_with_error(error_code, key, reason)
      self.error_code = error_code
      append_error(key, reason)
      nil # return nil explictly
    end

    def append_error(key, value)
      if value.is_a?(Hash)
        errors[key] ||= {}
        errors[key].merge!(value)
      else
        errors[key] = value
      end
    end
  end
end
