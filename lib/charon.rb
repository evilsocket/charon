require 'charon/resolver'

module Charon
  def self.query(name)
    Charon::Resolver.query name
  end
end
