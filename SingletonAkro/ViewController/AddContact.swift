import UIKit

class AddContact: UIViewController{
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lastnameText: UITextField!
    @IBOutlet weak var telText: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var textWarning: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (ControllerContacts.kind == -1) {
            nameText.text = ""
            lastnameText.text = ""
            telText.text = ""
            titleText.text = "Добавить новый контакт"
            buttonSave.setTitle("Add", for: .normal)
        }
        else {
            let contact = ControllerContacts.getContact(index: ControllerContacts.kind)
            nameText.text = contact.name
            lastnameText.text = contact.lastname
            telText.text = contact.tel
            titleText.text = "Редактировать контакт"
            buttonSave.setTitle("Save", for: .normal)
        }
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        if (nameText.text == "" ){
            textWarning.isHidden = false
            return
        }
        
        let contact = Contact(id: "", name: nameText.text!,
                              lastname: lastnameText.text, tel: telText.text)
        if (ControllerContacts.kind == -1) {
           ControllerContacts.addContact(contact: contact)
        }
        else {
            ControllerContacts.changeContact(index: ControllerContacts.kind, contact:  contact)
        }
        navigationController?.popViewController(animated: true)
    }
   
    
}
