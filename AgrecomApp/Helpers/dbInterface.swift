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
    try! conn.authenticate(
        username: "vapor_username",
        database: "vapor_database",
        password: "vapor_password"
    ).wait()

    //database and initial query testing
    let db: PostgresDatabase;

    //print a row of the Azure database to test
    //perform a parameterized query
    let rows = try! db.query("SELECT * FROM planets WHERE name = $1", ["Earth"]).wait()
    print(rows) // [["id": 42, "name": "Earth"]]

    //if necessary, print any columns as well
    let row: PostgresRow;
    let version = row.column("version")
    print(version) // PostgresData?

    //create a PostgresData type to convert column data to compatible Swift types
    let data: PostgresData;

    //after querying, print the data retreived in an appropriate format
    //print(try! data.jsonb(as: Foo.self)) //json example, Foo to be replaced
    //print(data.string)
    //print(data.int)
 }
*/