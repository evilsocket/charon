require 'resolv'
require 'charon/tlds'

module Charon
  class Resolver
    def self.resolver
      @@resolver ||= Resolv::DNS.new
    end

    def self.is_address?(name)
      name =~ Resolv::IPv4::Regex ? true : false
    end

    def self.fix_name(name)
      # reverse ip address
      if is_address? name
        name.split(".").reverse.join(".")
      # remove www.
      else
        tld = Charon::TLDS.select {|v| name =~ /#{v}$/}
        tld_size = tld.size > 0 ? tld.last.split(".").size : 1
        name.split(".")[-1-(tld_size)..-1].join(".")
      end
    end

    def self.query(name)
      name = self.fix_name name
      
      begin
        records = self.resolver.getresources( "#{name}.zen.spamhaus.org", Resolv::DNS::Resource::IN::A )
      rescue Resolv::ResolvError => e
        records = []
      end

      code = nil
      list = nil

      unless records.empty?
        code = records.first.address.to_s.split('.').last.to_i
        list = case code
               when 10..11
                 'Policy Block List'
               when 4..7
                 'Exploits Block List'
               when 3
                 'CSS Component'
               when 2
                 'Block List'
               else
                 'Unknown List'
               end
      end
      
      code.nil? ? nil : [ code, list ]
    end
  end
end
