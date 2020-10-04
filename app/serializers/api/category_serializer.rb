# frozen_string_literal: true

module Api
  class CategorySerializer < Api::BaseSerializer
    attributes :id, :title
  end
end
