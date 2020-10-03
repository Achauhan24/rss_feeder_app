# frozen_string_literal: true

module Api
  class BaseSerializer
    include FastJsonapi::ObjectSerializer

    def serializable_hash
      data = super[:data]
      return { data: data.map { |r| r[:attributes] }, meta: super[:meta] } if collection?(data)
      
      { data: data[:attributes] }
    end

    def to_json(_opts)
      serialized_json
    end

    def as_json(_options = nil)
      serializable_hash
    end

    def collection?(data)
      data.respond_to?(:size) && !data.respond_to?(:each_pair)
    end
  end
end
