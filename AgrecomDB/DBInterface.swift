//
//  DBInterface.swift
//  AgrecomApp
//
//  Created by Chris Achiles on 4/22/21.
//

//import the PostgresNIO library
import PostgresNIO

//attempts a connection and performs verification using a provided username, password, and database information (?)
func connect(user: String, db: String, pass: String) -> conn {
    //connect to the sql server
    let eventLoop: EventLoop = ...
    let conn = try PostgresConnection.connect(
        to: .makeAddressResolvingHost("agrecom-sql-test.postgres.database.azure.com", port: 5432),
        on: eventLoop
    ).wait()
    defer { try! conn.close().wait() }

    //once connected, attempt to authenticate with the server
    try conn.authenticate(
        username: user,
        database: db,
        password: pass
    ).wait()
}

//Using inputs *****, connect to the database, query the database for a specific report, and return the report
func getReport() ->  {
    
}