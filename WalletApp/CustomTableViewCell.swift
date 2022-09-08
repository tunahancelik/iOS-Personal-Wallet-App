//
//  CustomTableViewCell.swift
//  deneme
//
//  Created by Tunahan Çelik on 8.09.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var tableCard: UIView!
  @IBOutlet weak var label: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    tableCard.layer.cornerRadius = 10.0


  }
  

}
