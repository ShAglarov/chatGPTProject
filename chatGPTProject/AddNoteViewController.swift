//
//  AddNoteViewController.swift
//  chatGPTProject
//
//  Created by Shamil Aglarov on 22.01.2024.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    // Замыкание, которое будет вызвано при сохранении заметки
    var onSave: ((String) -> Void)?

    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextField()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder() // Активирует textField при появлении экрана
    }

    private func setupTextField() {
        view.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите заметку здесь"

        // Настройка Auto Layout для textField
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    private func setupNavigationBar() {
        navigationItem.title = "Новая заметка"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
    }

    @objc private func saveNote() {
        guard let noteText = textField.text, !noteText.isEmpty else { return }
        
        // Вызываем замыкание с текстом заметки
        onSave?(noteText)
        
        // Возвращаемся к предыдущему экрану
        navigationController?.popViewController(animated: true)
    }
}
