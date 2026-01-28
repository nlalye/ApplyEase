//
//  HomeViewController.swift
//  ApplyEase
//
//  Created by Nysa Lalye on 1/27/26.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.86, green: 0.91, blue: 0.83, alpha: 1.0)

        setupHeader()
        setupSummaryCard()
        setupButtons()
        setupSideCard()
    }

    private func setupHeader() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.82, green: 0.88, blue: 0.78, alpha: 1.0)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 220)
        ])

        let greetingLabel = UILabel()
        greetingLabel.text = "Good Day"
        greetingLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        greetingLabel.textColor = .darkGray
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = "[enter name]"
        nameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        nameLabel.textColor = .darkGray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let gear = UIButton(type: .system)
        gear.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        gear.tintColor = .darkGray
        gear.translatesAutoresizingMaskIntoConstraints = false
        gear.addTarget(self, action: #selector(openSettings), for: .touchUpInside)

        view.addSubview(greetingLabel)
        view.addSubview(nameLabel)
        view.addSubview(gear)

        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),

            gear.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            gear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            gear.widthAnchor.constraint(equalToConstant: 26),
            gear.heightAnchor.constraint(equalToConstant: 26)
        ])
    }

    private func setupSummaryCard() {
        let summaryView = UIView()
        summaryView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        summaryView.layer.cornerRadius = 24
        summaryView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(summaryView)

        let summaryLabel = UILabel()
        summaryLabel.text = "Summary"
        summaryLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        summaryLabel.textColor = .darkGray
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryView.addSubview(summaryLabel)

        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            summaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            summaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            summaryView.heightAnchor.constraint(equalToConstant: 260),

            summaryLabel.topAnchor.constraint(equalTo: summaryView.topAnchor, constant: 20),
            summaryLabel.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 20)
        ])
    }

    private func setupButtons() {
        let titles = ["Directory", "Mental Health", "Planner"]
        let colors: [UIColor] = [
            UIColor(red: 0.61, green: 0.69, blue: 0.57, alpha: 1.0),
            UIColor(red: 0.78, green: 0.86, blue: 0.76, alpha: 1.0),
            UIColor(red: 0.68, green: 0.74, blue: 0.66, alpha: 1.0)
        ]

        var previous: UIButton?

        for i in 0..<3 {
            let button = UIButton(type: .system)
            button.setTitle(titles[i], for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            button.backgroundColor = colors[i]
            button.setTitleColor(.darkGray, for: .normal)
            button.layer.cornerRadius = 18
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                button.widthAnchor.constraint(equalToConstant: 160),
                button.heightAnchor.constraint(equalToConstant: 44),
                button.topAnchor.constraint(equalTo: previous?.bottomAnchor ?? view.topAnchor, constant: previous == nil ? 500 : 20)
            ])

            previous = button
        }
    }

    private func setupSideCard() {
        let sideView = UIView()
        sideView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        sideView.layer.cornerRadius = 24
        sideView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideView)

        let label = UILabel()
        label.text = "To-Do List"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        sideView.addSubview(label)

        NSLayoutConstraint.activate([
            sideView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sideView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            sideView.widthAnchor.constraint(equalToConstant: 160),
            sideView.heightAnchor.constraint(equalToConstant: 200),

            label.topAnchor.constraint(equalTo: sideView.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: sideView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: sideView.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func openSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: true)
    }
}
