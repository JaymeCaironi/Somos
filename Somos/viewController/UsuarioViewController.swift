//
//  UsuarioViewController.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 16/03/21.
//

import UIKit

class UsuarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableViewUsuario: UITableView!
    var users: [User] = []
    var pesquisaUsu: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewUsuario.delegate = self
        tableViewUsuario.dataSource = self
        
//        print(pesquisaUsu)
        getUsers(pesquisaUsu: pesquisaUsu){
            result in
            self.users = result
            
            DispatchQueue.main.async {
                self.tableViewUsuario.reloadData()
            }
        }

/*        getUserData(gitUser: gitUser!, completed: {
            users in
            self.users = users
            DispatchQueue.main.async {
                self.tableViewUsuario.reloadData()
            }
                        
        }) */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaUsuario", for: indexPath) as! UsuarioTableViewCell
        
        celula.user = users[indexPath.row]
        return celula
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getUsers(pesquisaUsu: String, completed: @escaping([User]) -> Void) {
        
        if let url = URL(string: "https://api.github.com/users/" + pesquisaUsu + "/repos"){
            URLSession.shared.dataTask(with: url) {
                data, response, erro in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([User].self, from: data)
                        completed(res)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
/*    func getUser(pesquisaUsu: String, completed: @escaping([User]) -> Void) {
        
        if let url = URL(string: "https://api.github.com/users/" + pesquisaUsu){
            URLSession.shared.dataTask(with: url) {
                data, response, erro in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode([User].self, from: data)
                        completed(res)
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    } */
    
    
    @IBAction func favorito(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "segueFavoritos" {
            let cell = sender as! UsuarioTableViewCell
            let viewDestino = segue.destination as! FavoritosViewController
            
//            viewDestino.favoritos = cell.favoritos
    
        }
        
    }
    
}

struct User: Codable {
    
//    var pesquisaUsu: String = ""
    
//    let clientId = String ("5c8adfbafdc2c76192c7")
    let name: String
//    let login: String
//    let avatar_url: String
//    let owner: String
}
