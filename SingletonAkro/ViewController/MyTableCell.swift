//
//  MyTableCell.swift
//  SingletonAkro
//
//  Created by Admin on 09/11/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {


    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var telText: UILabel!
    @IBOutlet weak var lastText: UILabel!
    
    var cellindex: Int = -1
    
    @IBAction func deleteContact(_ sender: Any) {
        ControllerContacts.kind = cellindex
    }
    
    @IBAction func showEditContact(_ sender: Any) {
        ControllerContacts.kind = cellindex
    }
    
    func setup(index: Int) {
        let contact = ControllerContacts.getContact(index: index)
        nameText.text = contact.name
        lastText.text = contact.lastname
        telText.text = contact.tel
        cellindex = index
    }

}
