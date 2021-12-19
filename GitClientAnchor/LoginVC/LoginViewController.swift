//
//  LoginViewController.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit
import FirebaseAuth

let colorBackground = #colorLiteral(red: 0.9747640491, green: 0.9874252677, blue: 0.990709126, alpha: 1)
let colorTable = #colorLiteral(red: 0.8687392473, green: 0.9217450023, blue: 0.9595999122, alpha: 1)

class LoginViewController: UIViewController {
    
    private var presenter: LoginPresenter?

    //MARK: - Swith screen state Auth/Reg
    enum ScreenState {
        case regUser
        case authUser
    }
    
    private var stateBool: Bool = true {
        didSet {
            set(state: stateBool ? .regUser : .authUser)
            stateEnum = stateBool ? .regUser : .authUser
        }
    }
    
    private var stateEnum: ScreenState = .regUser
    
    private func set(state: ScreenState) {
        switch state {
        case .regUser:
            labelTop.text = "REGISTRATION"
            loginTextField.isHidden = false
            lineLogin.isHidden = false
            labelQuestion.text = "Already have an account?"
            buttonSwitch.setTitle("Authontication", for: .normal)
                
        case .authUser:
            labelTop.text = "AUTHONTICATON"
            loginTextField.isHidden = true
            lineLogin.isHidden = true
            labelQuestion.text = "Don't have an account?"
            buttonSwitch.setTitle("Registration", for: .normal)
        }
    }
    
    //MARK: - Properties
    private let labelTop: UILabel = {
        let label = UILabel()
        label.text = "REGISTRATION"
        label.textAlignment = .center
        label.font = UIFont(name: "Baskerville", size: 27)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelQuestion: UILabel = {
       let label = UILabel()
        label.text = "Already have an account?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.3294117647, green: 0.462745098, blue: 0.6705882353, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextField: CustomTextField = {
        let text = CustomTextField()
        text.configure("login", secureText: false)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let emailTextField: CustomTextField = {
        let text = CustomTextField()
        text.configure("email", secureText: false)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passTextField: CustomTextField = {
        let text = CustomTextField()
        text.configure("password", secureText: true)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let lineLogin: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private let lineEmail: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private let linePassword: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private let buttonSubmit = CustomButton(type: .system)

    private let buttonSwitch = CustomButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorBackground
        initialize()
        
        set(state: .regUser)
        presenter = LoginPresenter()
        presenter?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        resetTextField()
    }
    
    //MARK: - reset text in TextFieds
    private func resetTextField() {
        loginTextField.text = ""
        emailTextField.text = ""
        passTextField.text = ""
    }
}

//MARK: - Constraints
private extension LoginViewController {
    
    func initialize() {
        addingSubviews()
        contentsLayouts()
        
        buttonSubmit.configure(with: "Submit") { [unowned self] in
            self.buttonSubmitTapped(state: stateEnum)
        }
        
        buttonSwitch.configure(with: "Authontication") { [unowned self] in
            self.buttonSwitchTapped()
        }
    }
    
    func addingSubviews() {
        view.addSubview(labelTop)
        view.addSubview(stackView)
        view.addSubview(labelQuestion)
        view.addSubview(lineLogin)
        view.addSubview(lineEmail)
        view.addSubview(linePassword)
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passTextField)
        stackView.addArrangedSubview(buttonSubmit)
        stackView.addArrangedSubview(labelQuestion)
        stackView.addArrangedSubview(buttonSwitch)
    }

    func contentsLayouts() {
        screenLayout()
    }
    
    //MARK: - Setting layouts
    func screenLayout() {
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        buttonSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // - Top & Question labels
            labelTop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelQuestion.heightAnchor.constraint(equalToConstant: 36),
            
            // - Stack
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: labelTop.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            
            // - Text fields
            loginTextField.heightAnchor.constraint(equalToConstant: 36),
            emailTextField.heightAnchor.constraint(equalToConstant: 36),
            passTextField.heightAnchor.constraint(equalToConstant: 36),
            
            // - Lines
            lineLogin.heightAnchor.constraint(equalToConstant: 1),
            lineLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineLogin.bottomAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: -5),
            lineLogin.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            lineEmail.heightAnchor.constraint(equalToConstant: 1),
            lineEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineEmail.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -5),
            lineEmail.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            linePassword.heightAnchor.constraint(equalToConstant: 1),
            linePassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linePassword.bottomAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: -5),
            linePassword.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            // - Buttons
            buttonSubmit.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            buttonSubmit.heightAnchor.constraint(equalToConstant: 36),
            
            buttonSwitch.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            buttonSwitch.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}

//MARK: - Delegates
extension LoginViewController: LoginDelegate {

    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        
        let titleAttribut = NSAttributedString(string: "Ошибка!", attributes: [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.red
        ])

        alert.setValue(titleAttribut, forKey: "attributedTitle")
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [unowned self] action in
            self.resetTextField()
        }))

        self.present(alert, animated: true, completion: nil)
    }

    func moveToTabBar() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
}

//MARK: - Actions
private extension LoginViewController {

    func buttonSubmitTapped(state: ScreenState) {
        guard let presenter = presenter else { return }
        
        switch state {
        case .regUser:
            if let login = loginTextField.text,
               let email = emailTextField.text,
               let password = passTextField.text
            {
                presenter.regUser(login: login, email: email, password: password)
            }
                
        case .authUser:
            if let email = emailTextField.text,
               let password = passTextField.text
            {
                presenter.authUser(email: email, password: password)
            }
        }
    }

    func buttonSwitchTapped() {
        stateBool.toggle()
    }
}
