//
//  AddNoteViewController.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    let dataModel = DataModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeNavBarAppearance()
        
        dateLabel.text = "\(currentDate()) - 0 Characters"
        
        cancelButtonOutlet.roundButton(cancelButtonOutlet)
        doneButtonOutlet.roundButton(doneButtonOutlet)
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        let note = Note()
        note.text = noteTextView.text
        note.lastUpdated = Date()
        NoteInfo.noteArray.append(note)
        dataModel.saveData()
        navigationController?.popToRootViewController(animated: true)
    }
    
   
    @IBAction func cancelButton(_ sender: Any) {
        // TODO: Write to cancel function.
        navigationController?.popToRootViewController(animated: true)

    }
    
}

//MARK: - Date Formatter

extension AddNoteViewController {
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = " d MMM y, HH:mm E"
        let date = formatter.string(from: Date())
        return date
    }
}
