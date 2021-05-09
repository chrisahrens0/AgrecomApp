//
//  dbInterface.swift
//  AgrecomApp
//
//  Created by Chris Achiles and John Villalta on 4/28/21.
//

import Foundation
import PostgresKit
import PostgresNIO
/*
 /* Attempts a connection with authentication to the database, and afterwards
    performs a basic querying test of the database
 */
 func connect() {
     //create a connection

     let eventLoop: EventLoop;
    let conn = try! PostgresConnection.connect(
        to: .makeAddressResolvingHost("agrecom-sql-test.postgres.database.azure.com", port: 5432),
        on: eventLoop
    ).wait()
    defer { try! conn.close().wait() }

    //authenticate the connection with the database
    try conn.authenticate(
        username: "vapor_username",
        database: "vapor_database",
        password: "vapor_password"
    ).wait()

 }
*/