//
//  UsuarioTableViewCell.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 16/03/21.
//

import UIKit

class UsuarioTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarUsuario: UIImage!
    @IBOutlet weak var usuario: UILabel!
    @IBOutlet weak var package: UILabel!
    
    var user: User? {
        didSet{
            guard let user = user else {
                return
            }
            
            
            package.text = String(user.name)
            
//            usuario.text = String(user.login)
            
//            avatarUsuario.sd_setImage(with: URL(string: user.avatar_url ?? ""), completed: nil)

//            let url = URL(string: user.avatar_url ?? "")
//            let data = try? Data(contentsOf: url!)
//            avatarUsuario = UIImage(data: data!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
