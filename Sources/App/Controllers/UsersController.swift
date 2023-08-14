import Fluent
import Vapor

//struct UsersController: RouteCollection {
//    func create(req: Request) throws -> EventLoopFuture<User> {
//        // implementation
//    }
//}


public struct UsersController: RouteCollection {
    public func boot(routes: RoutesBuilder) throws {
        let usersRoute = routes.grouped("users")
        usersRoute.post(use: create)
        
        let tokenAuthRoutes = usersRoute.grouped(TokenAuthenticator())
        tokenAuthRoutes.get(use: getUsers)
    }

    func create(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
    }
    
    func getUsers(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
        
    func getAllUsers(req: Request) throws -> EventLoopFuture<[User]> {
        User.query(on: req.db).all()
        }
    }
}
