
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var waitView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ControllerContacts.appear(self)
        ControllerContacts.loadContact()
    }
    
   
    @IBAction func showAddContact(_ sender: Any) {
        ControllerContacts.kind = -1;
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ControllerContacts.lenght()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell1") as! MyTableCell
        cell.setup(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
        
}

