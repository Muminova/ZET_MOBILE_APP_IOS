//
//  SupportView.swift
//  ZET-Mobile
//
//  Created by ScrumTJ on 12/28/21.
//

import UIKit

class SupportView: UIView {

    lazy var title_info: UILabel = {
        let title = UILabel()
        title.text = "Горячая линия"
        title.numberOfLines = 1
        title.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 16)
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.textAlignment = .left
        title.frame = CGRect(x: 30, y: 0, width: UIScreen.main.bounds.size.width - 60, height: 30)
        title.autoresizesSubviews = true
        title.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return title
    }()
    
    lazy var number: UILabel = {
        let label = UILabel()
        label.text = "+992 (80) 800-800"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.frame = CGRect(x: 30, y: 30, width: 200, height: 28)
        label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return label
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 80, width: 50, height: 50))
        button.setImage(#imageLiteral(resourceName: "telegram"), for: UIControl.State.normal)
        //openmenu.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width / 2) - 80, y: 80, width: 50, height: 50))
        button.setImage(#imageLiteral(resourceName: "instagram"), for: UIControl.State.normal)
        //openmenu.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)

        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width / 2) + 35, y: 80, width: 50, height: 50))
        button.setImage(#imageLiteral(resourceName: "vk"), for: UIControl.State.normal)
        //openmenu.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width - 70, y: 80, width: 50, height: 50))
        button.setImage(#imageLiteral(resourceName: "facebook"), for: UIControl.State.normal)
        //openmenu.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)
        return button
    }()

    var white_view_back = UIView()
    
    let icon1: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Pin_alt_light")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        
        return iv
    }()
    
    lazy var title1: UILabel = {
        let title = UILabel()
        title.text = "Карта"
        title.numberOfLines = 1
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 17)
        title.textAlignment = .left
        title.frame = CGRect(x: (white_view_back.frame.width / 2) - 90, y: 10, width: 80, height: 45)
        
        return title
    }()
    
    let line: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        
        return label
    }()
    
    let icon2: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "list_map")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        
        return iv
    }()
    
    lazy var title2: UILabel = {
        let title = UILabel()
        title.text = "Список"
        title.numberOfLines = 1
        title.textColor = UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.00)
        title.font = UIFont.systemFont(ofSize: 16)
        title.textAlignment = .left
        title.frame = CGRect(x: (white_view_back.frame.width / 2) + 60, y: 10, width: 80, height: 45)
        
        return title
    }()
    
    let white_back = UIView(frame: CGRect(x: 0, y: 180, width: UIScreen.main.bounds.size.width, height: 896))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        white_view_back = UIView(frame: CGRect(x: 35, y: 150, width: UIScreen.main.bounds.size.width - 70, height: 65))
        
        icon1.frame = CGRect(x: (white_view_back.frame.width / 2) - 130, y: 20, width: 30, height: 30)
        icon2.frame = CGRect(x: (white_view_back.frame.width / 2) + 20, y: 20, width: 30, height: 30)
        line.frame = CGRect(x: white_view_back.frame.width / 2, y: 7, width: 2, height: 50)
        
        white_view_back.layer.cornerRadius = 20
        white_view_back.backgroundColor = .white
        white_view_back.layer.shadowRadius = 10
        white_view_back.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        white_view_back.layer.shadowOpacity = 1
        white_view_back.layer.shadowOffset = .zero
        
        white_view_back.addSubview(icon1)
        white_view_back.addSubview(title1)
        white_view_back.addSubview(icon2)
        white_view_back.addSubview(title2)
        white_view_back.addSubview(line)
        self.addSubview(white_view_back)
        
        white_back.backgroundColor = .white
        self.addSubview(white_back)
        self.sendSubviewToBack(white_back)
        
        self.addSubview(title_info)
        self.addSubview(number)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        self.addSubview(button4)
    }

}
