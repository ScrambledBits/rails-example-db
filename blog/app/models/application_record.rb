# frozen_string_literal: true

# The ApplicationRecord class is the base class for all models in the Rails application.
# It inherits from ActiveRecord::Base and serves as the primary abstract class.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
