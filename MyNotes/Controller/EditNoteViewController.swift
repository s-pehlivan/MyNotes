//
//  EditNoteViewController.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import UIKit

class EditNoteViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    let dataModel = DataModel()
    var note: Note?
    var currentArrayIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeNote = note {
            noteTextView.text = safeNote.text
            dateLabel.text = "Last Updated: \(safeNote.stringDate()) - \(safeNote.text.count) Characters"
            
            if let index = NoteInfo.noteArray.firstIndex(where: {$0 === safeNote}) {
                currentArrayIndex = index
            }
        }
        
        changeNavBarAppearance()

        cancelButtonOutlet.roundButton(cancelButtonOutlet)
        doneButtonOutlet.roundButton(doneButtonOutlet)
        
    }
    
    
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        if let index = currentArrayIndex {
            NoteInfo.noteArray.remove(at: index)
            dataModel.saveData()
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        // Updating the note
        if let safeIndex = currentArrayIndex {
            let note = NoteInfo.noteArray[safeIndex]
            note.text = noteTextView.text
            note.lastUpdated = Date()
            dataModel.saveData()
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func cancelbutton(_ sender: UIButton) {
            // TODO: Write to cancel function.
        navigationController?.popToRootViewController(animated: true)
    }
}
