//
//  File.swift
//  
//
//  Created by gssp on 8/14/23.
//

import Vapor

struct UserRequestBody: Content {
    let name: String
    let username: String
    let password: String
}
