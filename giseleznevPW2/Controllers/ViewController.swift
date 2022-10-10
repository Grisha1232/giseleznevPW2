//
//  ViewController.swift
//  giseleznevPW2
//
//  Created by Григорий Селезнев on 10/9/22.
//

import UIKit

class ViewController: UIViewController {

    let incrementButton = UIButton()
    
    let commentLabel = UILabel()
    let valueLabel = UILabel()
    
    var value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()
    }
    
    private func setupIncrementButton() {
        incrementButton.backgroundColor = .white
        incrementButton.layer.cornerRadius = 12
        incrementButton.applyShadows()
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.view.addSubview(incrementButton)
        incrementButton.setHeight(48)
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pinLeft(to: view.leadingAnchor, 24)
        incrementButton.pinRight(to: view.trailingAnchor, 24)
        
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        
        self.view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenterX(to: self.view.centerXAnchor)
    }
    
    @discardableResult
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        
        view.addSubview(commentView)
        commentView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        commentView.pinLeft(to: view.leadingAnchor, 24)
        commentView.pinRight(to: view.trailingAnchor, 24)
        
        commentLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        commentLabel.font = .systemFont(ofSize: 18, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.right: 16, .left: 16, .top: 16, .bottom: 16])
        
        return commentView
    }
    
    private func updateCommentView(value: Int) -> String {
        var result: String = ""
        switch  value {
            case 0...10:
                result = "1"
            case 10...20:
                result = "2"
            case 20...30:
                result = "3"
            case 30...40:
                result = "4"
            case 40...50:
                result = "🎉🎉🎉🎉🎉🎉🎉"
            case 50...60:
                result = "big boy"
            case 60...70:
                result = "70 70 70 moreeee"
            case 70...80:
                result = "⭐️⭐️⭐️⭐️⭐️⭐️"
            case 80...90:
                result = "80+\ngo higher"
            case 90...100:
                result = "Hooray!!! 90+"
            case 100... :
                result = "100!!! to the moon!!"
            default:
                break
        }
        return result
    }
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo:
        button.widthAnchor).isActive = true
        return button
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        colorsButton.addTarget(self, action: #selector(colorsButtonPressed(_:)), for: .touchUpInside)
        let notesButton = makeMenuButton(title: "📝")
        notesButton.addTarget(self, action: #selector(notesButtonPressed(_:)), for: .touchUpInside)
        let newsButton = makeMenuButton(title: "📰")
        newsButton.addTarget(self, action: #selector(newsButtonPressed(_:)), for: .touchUpInside)
         
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.pin(to: self.view, [.left: 24, .right: 24])
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    private func updateUI() {
        UIView.transition(with: valueLabel,
                      duration: 0.25,
                       options: .transitionCrossDissolve,
                          animations: { [weak self] in self?.valueLabel.text = String(self?.value ?? 0) },
                    completion: nil)
        UIView.transition(with: commentLabel,
                      duration: 0.25,
                       options: .transitionCrossDissolve,
                          animations: { [weak self] in self?.commentLabel.text = self?.updateCommentView(value: self?.value ?? 0) },
                    completion: nil)
    }
    
    
    @objc
    private func incrementButtonPressed(_ sender: UIButton) {
        incrementButton.applyHapticResponse()
        value += 1
        let generator = UIImpactFeedbackGenerator(style:  .light)
        generator.impactOccurred()
        
        
        UIView.animate(withDuration: 0.15) {
            self.updateUI()
        }
    }
    
    @objc
    private func colorsButtonPressed(_ sender: UIButton) {
        navigationController?.present(ColorsViewController(), animated: true, completion: nil)
    }
    
    @objc
    private func notesButtonPressed(_ sender: UIButton) {
        navigationController?.present(NotesViewController(), animated: true, completion: nil)
    }
    
    @objc
    private func newsButtonPressed(_ sender: UIButton) {
        navigationController?.present(NewsViewController(), animated: true, completion: nil)
    }
                                            
}

