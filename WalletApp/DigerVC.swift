//
//  DigerVC.swift
//  deneme
//
//  Created by Tunahan Çelik on 7.09.2022.
//

import Foundation
import UIKit
class DigerVC: UIViewController{
  @IBOutlet weak var cardView: UIView!
  override func viewDidLoad() {
    cardView.layer.cornerRadius = 10.0

    cardView.layer.shadowColor = UIColor.gray.cgColor

    cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

    cardView.layer.shadowRadius = 6.0

    cardView.layer.shadowOpacity = 0.7
  }
}
