//
//  DBHelper.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 22/03/21.
//

import Foundation
import SQLite3

class DBHelper {
    
    let dbPath: String = "favoritos.sqlite"
    var db:OpaquePointer?
    
    init(){
        db = openDatabase()
        createTable()
    }
    
    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS favoritos(Id INTEGER PRIMARY KEY,name TEXT,login TEXT, avatar_url TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("tabela de favoritos criada com sucesso.")
            } else {
                print("tabela de favoritos não foi criada.")
            }
        } else {
            print("CREATE TABLE não pode ser realizado.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(id:Int, name:String, login: String, avatar_url: String){
        let favoritos = read()
        for f in favoritos
        {
            if f.id == id
            {
                return
            }
        }
        let insertStatementString = "INSERT INTO favoritos (Id, name, login,, avatar_url) VALUES (NULL, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (login as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (avatar_url as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [Favoritos] {
        let queryStatementString = "SELECT * FROM favoritos;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Favoritos] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let login = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let avatar_url = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
//                psns.append(Favoritos(id: Int(id), name: name, login: login, avatar_url: avatar_url))
                print("Query Result:")
                print("\(id) | \(name) | \(login) | \(avatar_url)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM favoritos WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Deletado com Sucesso.")
            } else {
                print("Não foi deletado")
            }
        } else {
            print("Deletar o item não possivel, erro")
        }
        sqlite3_finalize(deleteStatement)
    }
    
}
