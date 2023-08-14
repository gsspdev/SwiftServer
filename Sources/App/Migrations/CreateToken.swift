//
//  File.swift
//  
//
//  Created by gssp on 8/14/23.
//

import Fluent

public struct CreateToken: Migration {
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tokens")
            .id()
            .field("user_id", .uuid, .required, .references("users", "id"))
            .field("value", .string, .required)
            .field("expires_at", .datetime)
            .create()
    }
    
    public func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tokens").delete()
    }
}
