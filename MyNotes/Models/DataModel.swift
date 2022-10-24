//
//  DataModel.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import Foundation

struct DataModel {
    
    func saveData() {
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(NoteInfo.noteArray)
            try data.write(to: NoteInfo.filepath!)
        }catch {
            print("Error encoding the data \(error)")
        }
        
    }
    
    func readData() {
        if let data = try? Data(contentsOf: NoteInfo.filepath!) {
            let decoder = PropertyListDecoder()
            do {
                NoteInfo.noteArray = try decoder.decode([Note].self, from: data)
            }catch {
                print("Error loading data \(error)")
            }
        }
    }
    
    func deleteData(note: Note) {
        print("DeleteData Method")
        print(note.text)
        // TODO: add the delete method.
    }
}
