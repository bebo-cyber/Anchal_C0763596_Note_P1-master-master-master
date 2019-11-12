//
//  folderTableViewController.swift
//  Anchal_C0763596_Note_P1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class folderTableViewController: UITableViewController {
    
    var indx  = -1
       var folderName = ""
       var selectedCell = 0

    @IBOutlet weak var trashNote: UIBarButtonItem!
    
    @IBOutlet weak var moveToAnotherFolder: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
         self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].name
               cell.accessoryType = .detailButton

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
         if (segue.identifier == "SegueToDetail") {
                        if let destVC = segue.destination as? noteViewController {
                            destVC.textString = notes[selectedCell].name
                            destVC.isEdit = true
                            destVC.index = selectedCell
                            destVC.folderName = folderName
        
                        }
                }
        if (segue.identifier == "SegueNewNote") {
                   let destinationVC = segue.destination as! noteViewController
                   destinationVC.folderName = folderName
               }
           }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            let cell = tableView.cellForRow(at: indexPath)
            if cell!.accessoryType == .detailButton {
                performSegue(withIdentifier: "SegueToDetail", sender: nil)
                selectedCell = indexPath.row
            }
    //            clickInfoNote(indexPath.row)
        }
    //    func clickInfoNote(_ index: Int) {
    //        print(index)
    //    }
        
    //    func updateText(text: String) {
    //        notes[selectedCell].name = text
    //    //        tableView.reloadData()
    //            let indexPath = IndexPath(item: selectedCell, section: 0)
    //            tableView.reloadRows(at: [indexPath], with: .fade)
    //    }
    }
    
 /*override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Hide the Navigation Bar
        tableView.reloadData()
    }
    @IBAction func addToAnotherFolder(_ sender: UIBarButtonItem) {
//        if let tableViewCell = sender as? UITableViewCell {
//            if let index = tableView.indexPath(for: tableViewCell)?.row {
//                notes[index] = Note(name: notes[index].name, folder: "New folder")
//            }
//        }
        
    }
    @IBAction func enableDisableButtons(_ sender: UIBarButtonItem) {
        trashNote.isEnabled = !trashNote.isEnabled
        moveToAnotherFolder.isEnabled = !moveToAnotherFolder.isEnabled
    }
       
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell!.accessoryType == .detailButton {
            cell!.accessoryType = .checkmark
        } else {
            cell!.accessoryType = .detailButton
        }
    }
 */



