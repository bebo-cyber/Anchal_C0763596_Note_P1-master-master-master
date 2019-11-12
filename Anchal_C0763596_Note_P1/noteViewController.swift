//
//  noteViewController.swift
//  Anchal_C0763596_Note_P1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class noteViewController: UIViewController {
    
    var textString: String?
       var folderName = ""
       var isEdit: Bool = false
       var index: Int?
    
     @IBOutlet weak var textViewDetail: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textViewDetail.text = textString ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        if textViewDetail.text != "" && !isEdit
        {
            notes.append(note(name: textViewDetail.text, folder: folderName))
            NSLog("Add note to the folder : \(folderName)")
            }
        else if textViewDetail.text != ""
        {
            notes[index!] = note(name:  textViewDetail.text, folder: folderName)
        }
    }

}
