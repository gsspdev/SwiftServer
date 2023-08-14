//
//  File.swift
//  
//
//  Created by gssp on 8/14/23.
//

import Fluent
import Vapor

public struct TokenAuthenticator: BearerAuthenticator {
    public func authenticate(bearer: BearerAuthorization, for request: Request) -> EventLoopFuture<Void> {
        let token = bearer.token
        return Token.query(on: request.db)
            .filter(\.$value == token)
            .with(\.$user)
            .first()
            .map { token in
                if let user = token?.user {
                    request.auth.login(user)
                }
            }
    }
}
