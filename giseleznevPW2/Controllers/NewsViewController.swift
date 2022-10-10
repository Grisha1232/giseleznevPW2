//
//  NewsViewController.swift
//  giseleznevPW2
//
//  Created by Григорий Селезнев on 10/10/22.
//

import UIKit


class NewsViewController: UIViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(label)
        label.font = .systemFont(ofSize: view.frame.width * 0.94, weight: .regular)
        label.text = "📰"
        label.pin(to: view, [.top: 0, .bottom: 0, .left: 0, .right: 0])
    }
}
