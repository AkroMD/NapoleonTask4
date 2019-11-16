
import UIKit

class ControllerContacts {
    
    private static var contacts = [Contact]() {
        didSet {
            view.table.reloadData()
            view.startView.isHidden = ControllerContacts.lenght() != 0
            view.table.isHidden = ControllerContacts.lenght() == 0
            view.waitView.isHidden = true
        }
    }
    private static let key = "mycontact"
    static var kind = 0;
    static weak var view: ViewController!
    
    private init() {}
    
    static func saveContact() {
   //     let data = try! NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: //false)
   //     UserDefaults.standard.set(data, forKey: key)
        
    }
    
    static func appear(_ myview: ViewController){
        view = myview
    }
    
    static func loadContact() {
        view.waitView.isHidden = false
        API.loadContacts { contactsArray in
            contacts = contactsArray }
        
    //    guard let data = UserDefaults.standard.data(forKey: key) else { return }
   //     guard let codeDate = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) else { return }
   //     contacts = codeDate as! [Contact]
    }
    
    
    static func addContact(contact: Contact) {
        view.waitView.isHidden = false
        API.createContac(name: contact.name, lastname: contact.lastname, tel: contact.tel) {
            result in
            guard result else {return}
            loadContact()
        }
        
    }
    
    
    static func changeContact(index: Int, contact: Contact) {
        view.waitView.isHidden = false
        API.editContac(contactID: contacts[index].id, name: contact.name, lastname: contact.lastname, tel: contact.tel) {
            result in
            guard result else {return}
            loadContact()
        }
        
    }
    
    
    static func deleteContact(index: Int) {
        view.waitView.isHidden = false
        API.deleteContact(contactID: contacts[index].id) { result in
            guard result else { return }
            loadContact()
        }
        
    }
    
    
    static func lenght() -> Int {
        contacts.count
    }
    
    
    static func getContact(index: Int) -> Contact {
        contacts[index]
    }
  
}
