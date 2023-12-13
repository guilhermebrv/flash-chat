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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.animateLogo(logo: screen?.logoLabel ?? UILabel())
        signProtocols()
    }

    private func signProtocols() {
        screen?.delegate(delegate: self)
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

