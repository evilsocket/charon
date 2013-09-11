$TESTING = true
require 'rubygems'
require 'minitest/pride'
require 'minitest/autorun'
require 'charon'

describe 'Charon' do
  describe 'Resolver' do
    it 'recognize a valid ip address' do
      assert Charon::Resolver.is_address? '127.0.0.1'
      assert Charon::Resolver.is_address? '127.0.0.255'

      assert Charon::Resolver.is_address?('127.0.0.300') == false      
      assert Charon::Resolver.is_address?('127.0.0.1.com') == false
      assert Charon::Resolver.is_address?('www.127.0.0.1') == false
    end

    it 'reverse an ip address' do
      assert_equal '1.0.0.127', Charon::Resolver.fix_name('127.0.0.1')
    end

    it 'remove the subdomain from an url' do
      assert_equal 'google.com',   Charon::Resolver.fix_name('www.google.com')
      assert_equal 'www.com',      Charon::Resolver.fix_name('www.com')
      assert_equal 'test.2000.hu', Charon::Resolver.fix_name('test.2000.hu')
      assert_equal 'test.2000.hu', Charon::Resolver.fix_name('www.test.2000.hu')
    end

    it 'have no records for clean address' do
      assert_nil Charon::Resolver.query '127.0.0.1'
      assert_nil Charon::Resolver.query '173.194.35.48'      
    end

    it 'have records for spam address' do
      code, list = Charon::Resolver.query '103.24.238.0'
      assert_equal 2, code
      assert_equal 'Block List', list

      code, list = Charon::Resolver.query '184.22.36.32'
      assert_equal 2, code
      assert_equal 'Block List', list
    end
  end
end

