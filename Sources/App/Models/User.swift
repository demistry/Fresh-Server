//
//  User.swift
//  App
//
//  Created by David Ilenwabor on 30/01/2019.
//

import Foundation

import Vapor
import FluentSQLite

final class User : Content {
    var id : Int?
    var name : String
    var email : String
    var sex : String
    var password : String
    
    init(name : String, email : String, sex : String, password : String) {
        self.name = name
        self.email = email
        self.sex = sex
        self.password = password
    }
}

extension User : SQLiteModel{//different models exist depending on ID type
    static let entity : String = "Users "//creates by default name of model with plural->s
}

extension User : Migration{
    
}
