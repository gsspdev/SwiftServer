import Fluent
import Vapor

//public func route(_ app: Application) throws {
////    UsersController.getUsers(Request.init(application: app)
////    UsersController.create(Request.init(application: app))
//
//
////    UsersController.create(Request.init(application: app, on: EventLoop),
//
////    try app.register(collection: userController)new())
//
////    app.post("users", use: UsersController.grouped(TokenAuthenticator()
//
//}

public func route(_ app: Application) throws {
    let usersController = UsersController()

    
    app.post("users", use: usersController.create)
//    app.get("users", use: usersController.getAllUsers)
    app.get("users", ":id", "name", "username", "password") { req -> EventLoopFuture<User> in
        let id = req.parameters.get("id", as: UUID.self)
        return User.find(id, on: req.db).unwrap(or: Abort(.notFound))
    }
    
}
