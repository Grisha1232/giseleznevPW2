//
//  NotesViewController.swift
//  giseleznevPW2
//
//  Created by Григорий Селезнев on 10/10/22.
//

import UIKit

class NotesViewController: UIViewController {
    let textBlock = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        textBlock.text = "Hello World!"
        textBlock.textAlignment = .center
        view.addSubview(textBlock)
        textBlock.pinCenter(to: view)
        textBlock.setHeight(view.frame.height / 3)
        textBlock.setWidth(view.frame.width)
    }
}
