//
//  ChangesViewController.swift
//  page72
//
//  Created by Sadyk on 30.12.2024.
//

import UIKit


class ChangesViewController: UIViewController {

    var labelEdit = UILabel()
    var nanes = "Заниматься спортом"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        labelEdit.text = nanes
        view.addSubview(labelEdit)
        labelEdit.textColor = .black
        labelEdit.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
    
    }
   
}
