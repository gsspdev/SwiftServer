//
//  File.swift
//  
//
//  Created by gssp on 8/14/23.
//

import Fluent

public struct CreateUser: Migration {
    public func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .id()
            .field("name", .string, .required)
            .field("username", .string, .required)
            .field("password", .string, .required)
            .create()
    }
    
    public func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
