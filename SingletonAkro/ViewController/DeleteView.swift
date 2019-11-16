import UIKit

class DeleteView: UIViewController {


    @IBAction func deleteContact(_ sender: Any) {
        ControllerContacts.deleteContact(index: ControllerContacts.kind)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
