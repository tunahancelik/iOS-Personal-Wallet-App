//
//  UlasimVC.swift
//  deneme
//
//  Created by Tunahan Çelik on 7.09.2022.
//

import Foundation
import UIKit

class UlasimVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var miktarText: UITextField!
  @IBOutlet weak var toplamText: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var ulasimText: UITextField!
  
  var giderArray = [String]()
  var harcamalar = [Double]()
  var harcamalarId = [UUID]()
  var toplam = 0.0
  
  let dataTool = Database()
  
  override func viewDidLoad() {
   
    cardView.layer.cornerRadius = 10.0

    cardView.layer.shadowColor = UIColor.gray.cgColor

    cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

    cardView.layer.shadowRadius = 6.0

    cardView.layer.shadowOpacity = 0.7
    tableView.separatorStyle = .none

    
    tableView.delegate = self
    tableView.dataSource = self
    let gestureRec = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(gestureRec)
    
    harcamalar = dataTool.veriGetir()
    harcamalarId = dataTool.idGetir()
    print(harcamalarId)
    for gider in harcamalar {
      toplam = toplam + gider
    }
    toplamText.text = "Toplam : \(toplam) tl"
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    harcamalar.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
    
    cell.label.text = String(harcamalar[indexPath.row])
    
    //var content = cell.defaultContentConfiguration()
    //content.text = String(harcamalar[indexPath.row])
    //cell.contentConfiguration = content
    
    return cell
  }
  
  
  
  @IBAction func ekleClicked(_ sender: Any) {
    if let veri = Double(miktarText.text!){
      let uuid = dataTool.ekle(harcama: veri, tip: 0)
      
      
      harcamalar.append(veri)
      harcamalarId.append(uuid)
      print(harcamalarId)
     
      print(harcamalar)
      print(harcamalarId)
      miktarText.text = ""
      
      
      toplam = toplam + veri
      
      toplamText.text = "Toplam : \(toplam) tl"
      
      tableView.reloadData()
    }
    
  }
  
  @objc func hideKeyboard(){
      view.endEditing(true)
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete{
        //print(harcamalarId[indexPath.row])
        dataTool.sil(idArray: harcamalarId[indexPath.row])
        toplam = toplam - harcamalar[indexPath.row]
        harcamalar.remove(at: indexPath.row)
        harcamalarId.remove(at: indexPath.row)
       
          
        
        toplamText.text = "Toplam : \(toplam) tl"
        self.tableView.reloadData()
      }
  }
  
  
  
  
}
