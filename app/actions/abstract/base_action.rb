# frozen_string_literal: true

module Abstract
  class BaseAction < Uncouple::Action
    include Actions::ErrorHandling
    class << self
      def record_class
        raise NotImplementedError
      end

      def record
        raise NotImplementedError
      end

      def record_type
        record_class.name.underscore.to_sym
      end

      def serializer
        raise NotImplementedError
      end
    end

    def permitted_params
      raise NotImplementedError
    end

    def perform
      @success = save_record! if validate!
    end

    def validate!
      record.present?
    end

    def save_record!
      record.assign_attributes(permitted_params)
      return true if record.save

      fail_with_error(422, self.class.record_type, record.errors)
    end

    def data
      @data ||= self.class.serializer.new(record)
    end
  end
end
