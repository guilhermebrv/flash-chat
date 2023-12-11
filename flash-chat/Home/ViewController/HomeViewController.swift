//
//  HomeViewController.swift
//  flash-chat
//
//  Created by Guilherme Viana on 07/12/2023.
//

import UIKit

class HomeViewController: UIViewController {

    private var screen: HomeView?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        viewModel.animateLogo(logo: screen?.logoLabel ?? UILabel())
        signProtocols()
    }

    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .systemPurple.withAlphaComponent(0.6)
        UINavigationBar.appearance().backgroundColor = .systemPurple.withAlphaComponent(0.6)
    }
}

extension HomeViewController: HomeViewProtocol {
    func tappedRegisterButton() {
        let register = RegisterViewController()
        navigationController?.pushViewController(register, animated: true)
    }
    
    func tappedLoginButton() {
        let login = LoginViewController()
        navigationController?.pushViewController(login, animated: true)
    }

}

