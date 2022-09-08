//
//  Database.swift
//  deneme
//
//  Created by Tunahan Çelik on 7.09.2022.
//

import Foundation
import UIKit
import CoreData



class Database{
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  var harcamaArray = [Double]()
  var harcamaID = [UUID]()
  
  func ekle(harcama:Double,tip:Int)->UUID{
    let context = appDelegate.persistentContainer.viewContext
    let newItem = NSEntityDescription.insertNewObject(forEntityName: "Giderler", into: context)
    
    newItem.setValue(harcama, forKey: "harcama")
    newItem.setValue(UUID(), forKey: "uuid")
    newItem.setValue(tip, forKey: "tur")
   
    do{
        try context.save()
        print("oldu")
    }catch{
        print("ekleme hatasi")
    }
    
    return newItem.value(forKey: "uuid") as! UUID
  }
  
  
  func sil(idArray:UUID){
    let context = appDelegate.persistentContainer.viewContext
    
    let fechRec = NSFetchRequest<NSFetchRequestResult>(entityName: "Giderler")
    fechRec.predicate = NSPredicate(format: "uuid = %@", idArray.uuidString)
    fechRec.returnsObjectsAsFaults = false
    
    do {
        let results = try context.fetch(fechRec)
        if results.count > 0 {
            for result in results as! [NSManagedObject]{
                if let id = result.value(forKey: "uuid") as? UUID {
                    if id == idArray{
                        context.delete(result)
                        
                        do{
                            try context.save()
                        }catch{
                            print("error")
                        }
                        break
                    }
                }
            }
        }
    } catch {
        print("eror")
   
    }
  }
  
  func veriGetir()->[Double]{
    let context = appDelegate.persistentContainer.viewContext
    
    let fechRec = NSFetchRequest<NSFetchRequestResult>(entityName: "Giderler")
    fechRec.returnsObjectsAsFaults = false
    
    do{
        let results = try context.fetch(fechRec)
        for result in results as! [NSManagedObject] {
            if let name = result.value(forKey: "harcama") as? Double{
                self.harcamaArray.append(name)
            }
        }
        
    } catch {
        print("hata")
    }
    return harcamaArray
  }
  func idGetir()->[UUID]{
    let context = appDelegate.persistentContainer.viewContext
    
    let fechRec = NSFetchRequest<NSFetchRequestResult>(entityName: "Giderler")
    fechRec.returnsObjectsAsFaults = false
    
    do{
        let results = try context.fetch(fechRec)
        for result in results as! [NSManagedObject] {
          if let nameID = result.value(forKey: "uuid") as? UUID{
              self.harcamaID.append(nameID)
          }
            
            
        }
        
    } catch {
        print("hata")
    }
    return harcamaID
  }
 
}
