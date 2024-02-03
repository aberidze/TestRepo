//
//  RatingsViewController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit

final class RatingsViewController: UIViewController {
    
    // MARK: - Properties
    private let customLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let ratingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var ratingList = Rating.dummyData
    
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        self.navigationItem.titleView = customLogo
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: nil, action: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundGray
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(ratingsTableView)
        setRatingsTableViewConstraints()
        configureTableView()
        registerCell()
    }
    
    private func configureTableView() {
        ratingsTableView.dataSource = self
        ratingsTableView.delegate = self
    }
    
    private func registerCell() {
        ratingsTableView.register(CustomRatingCell.self, forCellReuseIdentifier: "RatingCell")
    }
    
    
    // MARK: - Constraints & Margins
    private func setRatingsTableViewConstraints() {
        NSLayoutConstraint.activate([
            ratingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            ratingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            ratingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            ratingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}


// MARK: - TableView DataSource & Delegate
extension RatingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ratingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ratingsTableView.dequeueReusableCell(withIdentifier: "RatingCell", for: indexPath)
        let rating = ratingList[indexPath.row]
        if let ratingCell = cell as? CustomRatingCell {
            ratingCell.configure(rating: rating)
            ratingCell.backgroundColor = .clear
        }
        
        return cell
    }
}
