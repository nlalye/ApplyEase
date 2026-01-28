//
//  SettingsViewController.swift
//  ApplyEase
//
//  Created by Nysa Lalye on 1/27/26.
//

import UIKit

class SettingsViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.88, green: 0.93, blue: 0.85, alpha: 1.0)

        setupScrollView()
        setupHeader()
        setupAccountCard()
        setupNotificationCard()
        setupHelpCard()
        setupAboutCard()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupHeader() {
        let header = UIView()
        header.backgroundColor = UIColor(red: 0.74, green: 0.81, blue: 0.74, alpha: 1.0)
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)

        let title = UILabel()
        title.text = "Settings"
        title.font = UIFont(name: "ChalkboardSE-Regular", size: 22)
        title.textColor = .darkGray
        title.translatesAutoresizingMaskIntoConstraints = false

        let homeIcon = UIButton(type: .system)
        homeIcon.setImage(UIImage(systemName: "house.fill"), for: .normal)
        homeIcon.tintColor = .darkGray
        homeIcon.translatesAutoresizingMaskIntoConstraints = false
        homeIcon.addTarget(self, action: #selector(goHome), for: .touchUpInside)

        header.addSubview(title)
        header.addSubview(homeIcon)

        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 100),

            homeIcon.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 20),
            homeIcon.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -18),
            homeIcon.widthAnchor.constraint(equalToConstant: 26),
            homeIcon.heightAnchor.constraint(equalToConstant: 26),

            title.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: homeIcon.centerYAnchor)
        ])
    }

    @objc private func goHome() {
        if let nav = navigationController {
            nav.popToRootViewController(animated: true)
        } else {
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true)
        }
    }

    private func setupAccountCard() {
        let card = makeCard()

        let title = makeTitle("Account Information")

        let info = UILabel()
        info.numberOfLines = 0
        info.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        info.textColor = .darkGray
        info.text =
        "First Name: Boberino\n\nLast Name: Smithison\n\nEmail: bobsmithyyyy@gmail.com\n\nPhone Number: 408-777-9999\n\nPassword: ********"
        info.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton(type: .system)
        button.setTitle("Change Password", for: .normal)
        button.backgroundColor = UIColor(red: 0.78, green: 0.84, blue: 0.74, alpha: 1.0)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(title)
        card.addSubview(info)
        card.addSubview(button)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 18),

            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14),
            info.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            info.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18),

            button.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18),
            button.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 34)
        ])
    }

    private func setupNotificationCard() {
        let card = makeCard()

        let title = makeTitle("Notifications")

        let items = [
            "Deadlines",
            "Mental Health Reminders",
            "College News",
            "Bro idk do we have anymore"
        ]

        card.addSubview(title)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 18)
        ])

        var previous: UIView = title

        for text in items {
            let label = UILabel()
            label.text = text
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .darkGray
            label.translatesAutoresizingMaskIntoConstraints = false

            let toggle = UISwitch()
            toggle.onTintColor = UIColor(red: 0.70, green: 0.78, blue: 0.68, alpha: 1.0)
            toggle.translatesAutoresizingMaskIntoConstraints = false

            card.addSubview(label)
            card.addSubview(toggle)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 18),
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 18),

                toggle.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18),
                toggle.centerYAnchor.constraint(equalTo: label.centerYAnchor)
            ])

            previous = label
        }
    }

    private func setupHelpCard() {
        let card = makeCard()
        let title = makeTitle("Help & Support")

        let info = UILabel()
        info.numberOfLines = 0
        info.font = UIFont.systemFont(ofSize: 15)
        info.textColor = .darkGray
        info.text = "Email: applyease@gmail.com\n\nPhone Number: 408-666-6666"
        info.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(title)
        card.addSubview(info)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 18),

            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14),
            info.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            info.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18)
        ])
    }

    private func setupAboutCard() {
        let card = makeCard()
        let title = makeTitle("About")

        let info = UILabel()
        info.numberOfLines = 0
        info.font = UIFont.systemFont(ofSize: 15)
        info.textColor = .darkGray
        info.text =
        "Very brief description about what we do ya we like help with college ap stress plek use our app pls"
        info.translatesAutoresizingMaskIntoConstraints = false

        let footer = UILabel()
        footer.text = "Add logo or smth"
        footer.font = UIFont.systemFont(ofSize: 13)
        footer.textColor = .gray
        footer.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(title)
        card.addSubview(info)
        card.addSubview(footer)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 18),

            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14),
            info.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            info.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18),

            footer.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -18),
            footer.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18)
        ])
    }

    private func makeCard() -> UIView {
        let card = UIView()
        card.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        card.layer.cornerRadius = 24
        card.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(card)

        let previous = contentView.subviews.filter { $0 is UIView && $0 !== card }.last

        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            card.topAnchor.constraint(equalTo: previous?.bottomAnchor ?? headerBottomAnchor(), constant: 40)
        ])

        // If this is the last card, pin its bottom to contentView to stretch scrollView
        if contentView.subviews.filter({ $0 is UIView && $0 !== card }).isEmpty {
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        }

        return card
    }

    private func makeTitle(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func headerBottomAnchor() -> NSLayoutYAxisAnchor {
        return contentView.safeAreaLayoutGuide.topAnchor
    }
}
