//
//  ViewController.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var notesCollectionView: UICollectionView!
                    
    var cellWidth: CGFloat?
    
    let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NoteInfo.filepath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Notes.plist")
                
        dataModel.readData()
                
        notesCollectionView.dataSource = self
        notesCollectionView.delegate = self
        
        navigationItem.backButtonTitle = ""
        
        changeNavBarAppearance()
        changeCellLayout()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        notesCollectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.mainToEdit {
            let destinationVC = segue.destination as! EditNoteViewController
            let note = sender as? Note
            destinationVC.note = note
        }
    }
    
}


//MARK: - Collection View DataSource

extension MainPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NoteInfo.noteArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notePaper", for: indexPath) as! NotePageCollectionViewCell
        
        let note = NoteInfo.noteArray[indexPath.row]
        
        if let width = cellWidth {
            cell.layer.cornerRadius = width / 10
            cell.layer.masksToBounds = true
            
        }
        
        cell.noteCellLabel.text = note.text
        cell.dateLabel.text = note.stringDate()
        
        return cell
    }
    
    
}

//MARK: - Collection View Delegate

extension MainPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let note = NoteInfo.noteArray[indexPath.row]
        
        performSegue(withIdentifier: K.mainToEdit, sender: note)
    }
    
}


//MARK: - Change Navigation Bar Apperance

extension MainPageViewController {
    
    
    
}

//MARK: - Collection View Cell LayOut

extension MainPageViewController {
    func changeCellLayout() {
        
        
        let layout = UICollectionViewFlowLayout()
        
        let availableWidth = view.frame.size.width
        let cellInset = availableWidth / 30
        let cellWidth = (availableWidth - (cellInset * 3)) / 2
        self.cellWidth = cellWidth
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = cellInset
        layout.minimumLineSpacing = cellInset
        layout.sectionInset = UIEdgeInsets(top: cellInset, left: cellInset, bottom: cellInset, right: cellInset)
        notesCollectionView.collectionViewLayout = layout
        
        notesCollectionView.clipsToBounds = true
        notesCollectionView.layer.cornerRadius = cellWidth / 4
        
        
    }
}
