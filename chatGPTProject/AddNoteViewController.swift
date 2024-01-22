//
//  AddNoteViewController.swift
//  chatGPTProject
//
//  Created by Shamil Aglarov on 22.01.2024.
//

import UIKit

class AddNoteViewController: UIViewController {

    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextField()
        setupNavigationBar()
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
        // Логика сохранения заметки
        guard let noteText = textField.text, !noteText.isEmpty else { return }
        // Здесь код для сохранения заметки
        print("Сохраняемая заметка: \(noteText)")
    }
}
