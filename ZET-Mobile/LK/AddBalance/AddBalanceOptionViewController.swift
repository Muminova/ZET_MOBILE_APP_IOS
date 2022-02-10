//
//  AddBalanceOption.swift
//  ZET-Mobile
//
//  Created by ScrumTJ on 2/9/22.
//

import UIKit

class AddBalanceOptionViewController: UIViewController {
    
    let table = UITableView()
    
    let tableData = [["icon1", "Временный платеж"], ["iconn2", "Оплата Корти Милли"], ["icon3", "Попросить у друга"]]
    
    let add_balance_option = AddBalanceOptionView(frame: CGRect(x: 0, y: 44, width: UIScreen.main.bounds.size.width - 10, height: UIScreen.main.bounds.size.height / 4))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modalPresentationCapturesStatusBarAppearance = true
       
        add_balance_option.layer.cornerRadius = 10
        view.addSubview(add_balance_option)
        
        view.addSubview(table)
        table.frame = CGRect(x: 0, y: 100, width: Int(UIScreen.main.bounds.size.width) - 10, height: tableData.count * 80)
        table.register(AddBalanceOptionViewCell.self, forCellReuseIdentifier: "add_balance_cell")
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.estimatedRowHeight = 80
        table.alwaysBounceVertical = false
        table.separatorStyle = .none
        table.isScrollEnabled = false
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

}

extension AddBalanceOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "add_balance_cell", for: indexPath) as! AddBalanceOptionViewCell
        cell.accessoryType = .disclosureIndicator
        cell.titleOne.text = tableData[indexPath.row][1]
        //cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
    
    
}

class AddBalanceOptionView: UIView {
    
    lazy var close: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.size.width - 50, y: 20, width: 20, height: 20)
        button.setImage(#imageLiteral(resourceName: "close_icon"), for: UIControl.State.normal)
        button.isUserInteractionEnabled = false
        //button.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var title_push: UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 40, height: 50)
        title.text = "Пополнить счет"
        title.numberOfLines = 1
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textAlignment = .left
        
        return title
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
    }
    
    private func setupView() {
        backgroundColor = .white
    
        self.addSubview(title_push)
        self.addSubview(close)

    }
}