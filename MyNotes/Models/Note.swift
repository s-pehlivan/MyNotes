//
//  Note.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import Foundation

class Note: Codable {
    var text: String = ""
    var lastUpdated: Date = {
        var date = Date()
        let dateFormatter = DateFormatter()
        return date
    }()
    
    func stringDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = " d MMM y, HH:mm E"
        let date = formatter.string(from: self.lastUpdated)
        return date
    }
}

class NoteInfo: Codable {
    static var noteArray = [Note]()
    static var filepath: URL?
}
