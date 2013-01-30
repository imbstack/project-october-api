#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'october_types'

module Recommender
  class Client
    include ::Thrift::Client

    def ping()
      send_ping()
      return recv_ping()
    end

    def send_ping()
      send_message('ping', Ping_args)
    end

    def recv_ping()
      result = receive_message(Ping_result)
      return result.success unless result.success.nil?
      raise result.te unless result.te.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'ping failed: unknown result')
    end

    def recPosts(user_id)
      send_recPosts(user_id)
      return recv_recPosts()
    end

    def send_recPosts(user_id)
      send_message('recPosts', RecPosts_args, :user_id => user_id)
    end

    def recv_recPosts()
      result = receive_message(RecPosts_result)
      return result.success unless result.success.nil?
      raise result.nfe unless result.nfe.nil?
      raise result.ee unless result.ee.nil?
      raise result.te unless result.te.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'recPosts failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_ping(seqid, iprot, oprot)
      args = read_args(iprot, Ping_args)
      result = Ping_result.new()
      begin
        result.success = @handler.ping()
      rescue TimeoutException => te
        result.te = te
      end
      write_result(result, oprot, 'ping', seqid)
    end

    def process_recPosts(seqid, iprot, oprot)
      args = read_args(iprot, RecPosts_args)
      result = RecPosts_result.new()
      begin
        result.success = @handler.recPosts(args.user_id)
      rescue NotFoundException => nfe
        result.nfe = nfe
      rescue EngineException => ee
        result.ee = ee
      rescue TimeoutException => te
        result.te = te
      end
      write_result(result, oprot, 'recPosts', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Ping_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Ping_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    TE = 1

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRING, :name => 'success'},
      TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => TimeoutException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class RecPosts_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    USER_ID = 1

    FIELDS = {
      USER_ID => {:type => ::Thrift::Types::I64, :name => 'user_id'}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field user_id is unset!') unless @user_id
    end

    ::Thrift::Struct.generate_accessors self
  end

  class RecPosts_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    NFE = 1
    EE = 2
    TE = 3

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => PostList},
      NFE => {:type => ::Thrift::Types::STRUCT, :name => 'nfe', :class => NotFoundException},
      EE => {:type => ::Thrift::Types::STRUCT, :name => 'ee', :class => EngineException},
      TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => TimeoutException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

