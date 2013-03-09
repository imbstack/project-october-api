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

    def addUser(user_id)
      send_addUser(user_id)
      return recv_addUser()
    end

    def send_addUser(user_id)
      send_message('addUser', AddUser_args, :user_id => user_id)
    end

    def recv_addUser()
      result = receive_message(AddUser_result)
      return result.success unless result.success.nil?
      raise result.ee unless result.ee.nil?
      raise result.te unless result.te.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'addUser failed: unknown result')
    end

    def user_v_post(user_id, verb, post_id)
      send_user_v_post(user_id, verb, post_id)
      recv_user_v_post()
    end

    def send_user_v_post(user_id, verb, post_id)
      send_message('user_v_post', User_v_post_args, :user_id => user_id, :verb => verb, :post_id => post_id)
    end

    def recv_user_v_post()
      result = receive_message(User_v_post_result)
      raise result.nfe unless result.nfe.nil?
      return
    end

    def user_v_comment(user_id, verb, comment_id)
      send_user_v_comment(user_id, verb, comment_id)
      recv_user_v_comment()
    end

    def send_user_v_comment(user_id, verb, comment_id)
      send_message('user_v_comment', User_v_comment_args, :user_id => user_id, :verb => verb, :comment_id => comment_id)
    end

    def recv_user_v_comment()
      result = receive_message(User_v_comment_result)
      raise result.nfe unless result.nfe.nil?
      return
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

    def process_addUser(seqid, iprot, oprot)
      args = read_args(iprot, AddUser_args)
      result = AddUser_result.new()
      begin
        result.success = @handler.addUser(args.user_id)
      rescue EngineException => ee
        result.ee = ee
      rescue TimeoutException => te
        result.te = te
      end
      write_result(result, oprot, 'addUser', seqid)
    end

    def process_user_v_post(seqid, iprot, oprot)
      args = read_args(iprot, User_v_post_args)
      result = User_v_post_result.new()
      begin
        @handler.user_v_post(args.user_id, args.verb, args.post_id)
      rescue NotFoundException => nfe
        result.nfe = nfe
      end
      write_result(result, oprot, 'user_v_post', seqid)
    end

    def process_user_v_comment(seqid, iprot, oprot)
      args = read_args(iprot, User_v_comment_args)
      result = User_v_comment_result.new()
      begin
        @handler.user_v_comment(args.user_id, args.verb, args.comment_id)
      rescue NotFoundException => nfe
        result.nfe = nfe
      end
      write_result(result, oprot, 'user_v_comment', seqid)
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

  class AddUser_args
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

  class AddUser_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0
    EE = 1
    TE = 2

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
      EE => {:type => ::Thrift::Types::STRUCT, :name => 'ee', :class => EngineException},
      TE => {:type => ::Thrift::Types::STRUCT, :name => 'te', :class => TimeoutException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class User_v_post_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    USER_ID = 1
    VERB = 2
    POST_ID = 3

    FIELDS = {
      USER_ID => {:type => ::Thrift::Types::I64, :name => 'user_id'},
      VERB => {:type => ::Thrift::Types::I32, :name => 'verb', :enum_class => Action},
      POST_ID => {:type => ::Thrift::Types::I64, :name => 'post_id'}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field user_id is unset!') unless @user_id
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field verb is unset!') unless @verb
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field post_id is unset!') unless @post_id
      unless @verb.nil? || Action::VALID_VALUES.include?(@verb)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field verb!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class User_v_post_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NFE = 1

    FIELDS = {
      NFE => {:type => ::Thrift::Types::STRUCT, :name => 'nfe', :class => NotFoundException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class User_v_comment_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    USER_ID = 1
    VERB = 2
    COMMENT_ID = 3

    FIELDS = {
      USER_ID => {:type => ::Thrift::Types::I64, :name => 'user_id'},
      VERB => {:type => ::Thrift::Types::I32, :name => 'verb', :enum_class => Action},
      COMMENT_ID => {:type => ::Thrift::Types::I64, :name => 'comment_id'}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field user_id is unset!') unless @user_id
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field verb is unset!') unless @verb
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field comment_id is unset!') unless @comment_id
      unless @verb.nil? || Action::VALID_VALUES.include?(@verb)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field verb!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class User_v_comment_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    NFE = 1

    FIELDS = {
      NFE => {:type => ::Thrift::Types::STRUCT, :name => 'nfe', :class => NotFoundException}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

