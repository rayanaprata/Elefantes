//
//  CelulaCustomizadaElefanteTableViewCell.swift
//  Elefantes
//
//  Created by Wilson Baraban Filho on 10/20/21.
//

import UIKit

class CelulaCustomizadaElefanteTableViewCell: UITableViewCell {

    @IBOutlet weak var uil_Titulo: UILabel!
    @IBOutlet weak var uil_Note: UILabel!
    @IBOutlet weak var uiiv_Image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        uiiv_Image.contentMode = .scaleAspectFill
        uiiv_Image.layer.cornerRadius = 50

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
