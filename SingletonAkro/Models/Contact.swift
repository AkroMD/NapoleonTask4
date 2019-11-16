import Foundation

enum Keys: String {
    case id = "id"
    case name = "name"
    case lastName = "lastName"
    case tel = "tel"
}

class Contact: NSObject, NSCoding {
    
   
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Keys.name.rawValue)
        coder.encode(lastname, forKey: Keys.lastName.rawValue)
        coder.encode(tel, forKey: Keys.tel.rawValue)
    }
    
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: Keys.name.rawValue) as! String
        let lastname = coder.decodeObject(forKey: Keys.lastName.rawValue) as! String
        let tel = coder.decodeObject(forKey: Keys.tel.rawValue) as! String
        let id = coder.decodeObject(forKey: Keys.id.rawValue) as! String
        self.init(id: id, name: name, lastname: lastname, tel: tel)
    }
    
    var id: String
    var name: String
    var lastname: String?
    var tel: String?
    
    init(id: String, name: String, lastname: String?, tel: String?) {
        self.id = id
        self.name = name
        self.lastname = lastname
        self.tel = tel
    }
    
    init(id: String, data: JSON) {
        self.id = id
        self.name = data["name"] as! String
        self.lastname = data["lastname"] as! String?
        self.tel = data["tel"] as! String?
    }
   
}



