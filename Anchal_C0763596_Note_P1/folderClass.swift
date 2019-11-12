//
//  folderClass.swift
//  Anchal_C0763596_Note_P1
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class folderClass: UITableViewController {
    
    @IBOutlet var folderTableView: UITableView!
    
    var folders: [String]?

   
    override func viewDidLoad() {
        super.viewDidLoad()

        folders = []
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   
        
     
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folders?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let folderNote = folders![indexPath.row]
        cell.textLabel?.text = folderNote
        cell.imageView?.image = UIImage(named: "folder-icon")
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              // Get the new view controller using segue.destination.
              // Pass the selected object to the new view controller.

              // Send folder's name to other page
              let destinationVC = segue.destination as! folderTableViewController
              if let tableViewCell = sender as? UITableViewCell {
                  if let index = tableView.indexPath(for: tableViewCell)?.row
                  {
                    // destinationVC.folderName = folders[index].name
                  }
              }
          }
    
   // to create new folder
    @IBAction func newFolder(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New folder", message: "Enter a name for this folder", preferredStyle: .alert)
                          
                          
              let confirmAction = UIAlertAction(title: "Add Item", style: .default, handler: {[weak alertController]
                           (_) in
              
              let note = alertController?.textFields![0]
              self.folders?.append(note!.text!)
              self.folderTableView.reloadData()
              })
                    
             
                          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                          { (_) in }
                          
                          alertController.addTextField
                              { (textfield) in
                                  textfield.placeholder = "Enter name"
                          }
                          alertController.addAction(confirmAction)
                          alertController.addAction(cancelAction)

                          self.present(alertController,animated: true, completion: nil)
          
    }
    
      
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let moveFolder = folders?[sourceIndexPath.item]
        folders?.remove(at: sourceIndexPath.item)
        folders?.insert(moveFolder!, at: destinationIndexPath.item)
    }
        // removing delete in edit
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return folderTableView.isEditing ? .none : .delete
    }
    
        // swipe for deletion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete)
        {
            folders?.remove(at: indexPath.row)
            folderTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        // to edit
    @IBAction func edit(_ sender: UIBarButtonItem) {
        self.folderTableView.isEditing = !self.folderTableView.isEditing
        sender.title = (self.folderTableView.isEditing) ? "Done" : "Edit"
    }
        

}


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


