module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = where(nil)
      filtering_params&.each { |key, value| results = results.public_send(key, value) if value.present? }
      results
    end
  end
end
