import Fluent
import Vapor

public final class Token: Model, Content {
    public static let schema: String = "tokens"
    
    @ID(key: .id)
    public var id: UUID?
    
    @Parent(key: "user_id")
    public var user: User
    
    @Field(key: "value")
    public var value: String
    
    @Timestamp(key: "expires_at", on: .create)
    public var expiresAt: Date?
    
    public init() { }
    
    public init(id: UUID? = nil, userId: User.IDValue, value: String, expiresAt: Date?) {
        self.id = id
        self.$user.id = userId
        self.value = value
        self.expiresAt = expiresAt
    }
}
