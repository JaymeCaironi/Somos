//
//  FavoritoTableViewCell.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 17/03/21.
//

import UIKit
import FirebaseFirestore

class FavoritoTableViewCell: UITableViewCell {
    
    var firestore: Firestore!
    var favoritos: [Dictionary<String, Any>] = []
    var db:DBHelper = DBHelper()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
