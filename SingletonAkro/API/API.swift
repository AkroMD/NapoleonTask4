
import Foundation

typealias JSON = [String : Any]

enum API {
    
    static var identifier: String { "Akromd" }
    static var baseURL: String {
        "https://ios-napoleonit.firebaseio.com/data/\(identifier)/"
    }
    static var storageName: String { "contacts" }
    
    static func loadContacts(completion: @escaping ([Contact]) -> Void) {
        let url = URL(string: baseURL + ".json")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON
            else { return }
            
            guard
                let notesJSON = json[storageName] as? JSON
                else { return }
            var contacts = [Contact]()

            for note in notesJSON {
                contacts.append(Contact(id: note.key, data: note.value as! JSON))
            }
            
            contacts.sort { $0.name.lowercased() < $1.name.lowercased() }
            
            DispatchQueue.main.async {
                completion(contacts)
            }
        }
        task.resume()
    }
    
    static func createContac(name: String, lastname: String?, tel: String?, completion: @escaping (Bool) -> Void) {
        let params = [
            "name": name,
            "lastname": lastname,
            "tel": tel
        ]
        
        let url = URL(string: baseURL + "/\(storageName).json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }
    
    static func editContac(contactID: String, name: String, lastname: String?, tel: String?, completion: @escaping (Bool) -> Void) {
        let params = [
            "name": name,
            "lastname": lastname,
            "tel": tel
        ]
        
        let url = URL(string: baseURL + "/\(storageName)/\(contactID)/.json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PATCH"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }
    
    static func deleteContact(contactID: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: baseURL + "/\(storageName)/\(contactID)/.json")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(error == nil)
        }
        task.resume()
    }
    
}

