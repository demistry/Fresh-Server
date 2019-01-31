import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    
    let userRouteGroup = router.grouped("user")
    // Basic "Hello, world!" example
    userRouteGroup.get("login") { req -> String in
        let username = try req.query.get(String.self, at: "username")
        let ID = try req.query.get(Int.self, at: "id")
        return "User : \(username) logged in with ID of \(ID)"
    }
    
    userRouteGroup.post(User.self, at: "create") { (request, user) -> Future<User> in
        return user.save(on: request)
    }
    
    userRouteGroup.get("allUsers") { (request) -> Future<[User]> in
        return User.query(on: request).all()
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
