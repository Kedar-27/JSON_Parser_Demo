//
//  CardsVC.swift
//  JSON_Parser
//
//  Created by Kedar Sukerkar on 28/04/20.
//  Copyright © 2020 Kedar-27. All rights reserved.
//

import UIKit


class CardsVC: UIViewController {
    
    // MARK: - Outlets
    lazy var cardsTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    
    
    // MARK: - Properties
    var userDetails = [UserDetail](){
        didSet{
            self.cardsTableView.reloadData()
        }
        
    }
    
    
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupVC()
        self.setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getUserDetails()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view.endEditing(true)
    }
    
    private func setupVC(){
        self.view.addSubview(self.cardsTableView)
        
        self.cardsTableView.delegate = self
        self.cardsTableView.dataSource = self
        self.cardsTableView.register(UserDetailsTableViewCell.self, forCellReuseIdentifier: "UserDetailsTableViewCell")
        
    }
    
    private func setupConstraints(){
        [
            self.cardsTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.cardsTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.cardsTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.cardsTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
            ].forEach({$0.isActive = true})
    }
    
    
    
    private func setupUI(){
        
        
        
        
    }
    // MARK: - Network Requests
    func getUserDetails(){
        KSNetworkManager.shared.sendRequest(baseUrl: URLs.baseURL, methodType: .get, apiName: URLs.userDetails, parameters: nil, headers: nil) { (result) in
            
            switch result{
                
            case .success(let data):
                if let data = data as? Data{
                    KSNetworkManager.shared.getJSONDecodedData(from: data) { (result: Swift.Result<[UserDetail], Error>) in
                        
                        switch result{
                            
                        case .success(let data):
                            DispatchQueue.main.async { [weak self] in
                                guard let strongSelf = self else {return}
                                strongSelf.userDetails = data
                            }
                            break
                            
                        case .failure(let error):
                            print(error)
                            break
                        }
                        
                    }
                }
                break
                
            case .failure(let error):
                print(error)
                break
            }

        }
        
        
        
        
        
    }
    
}
extension CardsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTableViewCell") as? UserDetailsTableViewCell else{return UITableViewCell()}
        
        let data = self.userDetails[indexPath.row]
        
        cell.configureCell(name: data.name, age: data.age, location: data.location, imageURL: data.url)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 0.18
    }
    
    
    
    
    
    
    
    
}
