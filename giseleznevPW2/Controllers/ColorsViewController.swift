//
//  ColorsViewController.swift
//  giseleznevPW2
//
//  Created by Григорий Селезнев on 10/10/22.
//

import UIKit

final class ColorsViewController: UIViewController {
    var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        for i in 0...6 {
            view.addSubview(views[i])
            if (i == 0) {
                views[i].pinTop(to: view.safeAreaLayoutGuide.topAnchor, 6)
            } else {
                views[i].pinTop(to: views[i - 1].bottomAnchor)
            }
            views[i].setHeight(view.frame.height / 7)
            views[i].pin(to: self.view, [.right: 6, .left: 6])
        }
    }
    
    private func setupViews() {
        let colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.systemBlue, UIColor.blue, UIColor.purple]
        for color in colors {
            let view = UIView()
            view.backgroundColor = color
            views.append(view)
        }
    }
}
