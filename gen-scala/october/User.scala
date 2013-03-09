/**
 * generated by Scrooge 3.0.5-SNAPSHOT
 */
package october

import com.twitter.scrooge.{ThriftException, ThriftStruct, ThriftStructCodec}
import org.apache.thrift.protocol._
import java.nio.ByteBuffer
import com.twitter.finagle.SourcedException
import scala.collection.mutable
import scala.collection.{Map, Set}

/** A user id from the frontend
 * @param id, the id the frontend uses for a user
 */
object User extends ThriftStructCodec[User] {
  val Struct = new TStruct("User")
  val UserIdField = new TField("userId", TType.I64, 1)

  /**
   * Checks that all required fields are non-null.
   */
  def validate(_item: User) {
  }

  def encode(_item: User, _oproto: TProtocol) { _item.write(_oproto) }
  def decode(_iprot: TProtocol) = Immutable.decode(_iprot)

  def apply(_iprot: TProtocol): User = decode(_iprot)

  def apply(
    userId: Long
  ): User = new Immutable(
    userId
  )

  def unapply(_item: User): Option[Long] = Some(_item.userId)

  object Immutable extends ThriftStructCodec[User] {
    def encode(_item: User, _oproto: TProtocol) { _item.write(_oproto) }
    def decode(_iprot: TProtocol) = {
      var userId: Long = 0L
      var _got_userId = false
      var _done = false
      _iprot.readStructBegin()
      while (!_done) {
        val _field = _iprot.readFieldBegin()
        if (_field.`type` == TType.STOP) {
          _done = true
        } else {
          _field.id match {
            case 1 => { /* userId */
              _field.`type` match {
                case TType.I64 => {
                  userId = {
                    _iprot.readI64()
                  }
                  _got_userId = true
                }
                case _ => TProtocolUtil.skip(_iprot, _field.`type`)
              }
            }
            case _ => TProtocolUtil.skip(_iprot, _field.`type`)
          }
          _iprot.readFieldEnd()
        }
      }
      _iprot.readStructEnd()
      if (!_got_userId) throw new TProtocolException("Required field 'User' was not found in serialized data for struct User")
      new Immutable(
        userId
      )
    }
  }

  /**
   * The default read-only implementation of User.  You typically should not need to
   * directly reference this class; instead, use the User.apply method to construct
   * new instances.
   */
  class Immutable(
    val userId: Long
  ) extends User

  /**
   * This Proxy trait allows you to extend the User trait with additional state or
   * behavior and implement the read-only methods from User using an underlying
   * instance.
   */
  trait Proxy extends User {
    protected def _underlying_User: User
    def userId: Long = _underlying_User.userId
  }
}

trait User extends ThriftStruct
  with Product1[Long]
  with java.io.Serializable
{
  import User._

  def userId: Long

  def _1 = userId

  override def write(_oprot: TProtocol) {
    User.validate(this)
    _oprot.writeStructBegin(Struct)
    if (true) {
      val userId_item = userId
      _oprot.writeFieldBegin(UserIdField)
      _oprot.writeI64(userId_item)
      _oprot.writeFieldEnd()
    }
    _oprot.writeFieldStop()
    _oprot.writeStructEnd()
  }

  def copy(
    userId: Long = this.userId
  ): User = new Immutable(
    userId
  )

  override def canEqual(other: Any): Boolean = other.isInstanceOf[User]

  override def equals(other: Any): Boolean = runtime.ScalaRunTime._equals(this, other)

  override def hashCode: Int = runtime.ScalaRunTime._hashCode(this)

  override def toString: String = runtime.ScalaRunTime._toString(this)


  override def productArity: Int = 1

  override def productElement(n: Int): Any = n match {
    case 0 => userId
    case _ => throw new IndexOutOfBoundsException(n.toString)
  }

  override def productPrefix: String = "User"
}