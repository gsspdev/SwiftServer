//
//  File.swift
//  
//
//  Created by gssp on 8/14/23.
//

// Models/User.swift

import Fluent
import Vapor

public final class User: Model, Content, Authenticatable {
    public static let schema: String = "users"
    
    @ID(key: .id)
    public var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "username")
    var username: String

    @Field(key: "password")
    var password: String

    public init() { }

    public init(id: UUID? = nil, name: String, username: String, password: String) {
        self.id = id
        self.name = name
        self.username = username
        self.password = password
    }
}
