//
//  DetailViewController.swift
//  page72
//
//  Created by Sadyk on 22.12.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var cellLabel: UILabel!
   
    var chanVC = ChangesViewController()
    
    var name = ""
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellLabel.text = name
       
        showAlert()
        
    
        
        
        
        

    }
    func showAlert(){
        let alert = UIAlertController(title: "", message:nil, preferredStyle: .actionSheet)
        let image = UIImage(systemName: "pencil")
   
        let alertEdit  = UIAlertAction(title: "Редактировать", style: .default){  _ in
           
         //  self.cellLabel.text = "Заниматься спортом"
            self.navigationController?.pushViewController(self.chanVC, animated: true)
         
            
        }
        alertEdit.setValue(image, forKey: "image")
       
    
        let imageShar = UIImage(systemName: "square.and.arrow.up.fill")
        let alertShare  = UIAlertAction(title: "Поделиться", style: .default){ _ in
          
        
        }
       alertShare.setValue(imageShar, forKey: "image")
        
    
        let alertDelete = UIImage(systemName: "delete.left")
        let showRecord = UIAlertAction(title: "Удалить", style: .destructive){_ in
            
            self.navigationController?.popViewController(animated: true)
        }
     showRecord.setValue(alertDelete, forKey: "image")
        
        
        
        
        
        
        
        
        
        alert.addAction(alertEdit)
        alert.addAction(alertShare)
        alert.addAction(showRecord)
        present(alert,animated: true)
        
       
    }
 
    
    
        }
    

