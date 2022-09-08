//
//  Harcamalar.swift
//  deneme
//
//  Created by Tunahan Çelik on 7.09.2022.
//

import Foundation
enum Tip:Int {
case Ulasim = 0,
  Marker = 1,
  Diger = 3
}
class Harcamalar{
  var harcama:Double?
  var harcamaType:Tip
  
  init(harcama:Double,harcamaType:Int,tip:Tip) {
    self.harcama = harcama
    self.harcamaType = tip
  }
  
}
