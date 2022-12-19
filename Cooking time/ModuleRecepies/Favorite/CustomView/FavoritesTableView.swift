//
//  TableViewFavorites.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 19.12.2022.
//

import UIKit

public class FavoritesTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var items = ["0","1","2","3"]
    var cellIdentifier = "recepy"
    var refresh = UIRefreshControl()
    var myTableView = UITableView() {
        didSet {
            self.myTableView = UITableView(frame: self.bounds, style: .plain)
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            myTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            myTableView.separatorColor = .black
            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
            myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myTableView.delegate = self
        myTableView.dataSource = self
        self.addSubview(myTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UITableViewDataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        var cellProperties = cell.defaultContentConfiguration()
        cellProperties.text = item
        cell.contentConfiguration = cellProperties
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
}

