//
//  ZeroButtonViewController.swift
//  ZET-Mobile
//
//  Created by ScrumTJ on 05/05/22.
//

import UIKit
import RxSwift
import RxCocoa

var packet_tax = ""
var packet_sum = ""
var packet_amount = ""
var packet_name = ""
var packet_id = ""

class ZeroButtonViewController: UIViewController {
    let defaultLocalizer = AMPLocalizeUtils.defaultLocalizer
    let disposeBag = DisposeBag()
    
    var alert = UIAlertController()
    let scrollView = UIScrollView()
    
    let zero_button_view = ZeroButtonView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 180, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modalPresentationCapturesStatusBarAppearance = true
       
        view.addSubview(zero_button_view)
        
        zero_button_view.sendButton.addTarget(self, action: #selector(okTrueDialog), for: .touchUpInside)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func translateTrafic(_ sender: UIButton) {
        
        alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n", message: "", preferredStyle: .alert)
        let widthConstraints = alert.view.constraints.filter({ return $0.firstAttribute == .width })
        alert.view.removeConstraints(widthConstraints)
        // Here you can enter any width that you want
        let newWidth = UIScreen.main.bounds.width * 0.80
        // Adding constraint for alert base view
        let widthConstraint = NSLayoutConstraint(item: alert.view,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: newWidth)
        alert.view.addConstraint(widthConstraint)
        
        let view = AlertView2()
        view.backgroundColor = alertColor
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 80, height: 380)
        view.layer.cornerRadius = 20
        view.name.text = defaultLocalizer.stringForKey(key: "Help_at_zero")
        view.image_icon.image = (UserDefaults.standard.string(forKey: "ThemeAppereance") == "dark" ? UIImage(named: "first.png") : UIImage(named: "first_l.png"))
        
        let cost: NSString = defaultLocalizer.stringForKey(key: "Connect_the_package") as NSString
        let range = (cost).range(of: cost as String)
        let costString = NSMutableAttributedString.init(string: cost as String)
        costString.addAttribute(NSAttributedString.Key.foregroundColor, value: colorBlackWhite , range: range)
        costString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], range: range)
        
        var title_cost = " '" + packet_name + "'" as NSString
            
        let titleString = NSMutableAttributedString.init(string: title_cost as String)
        let range2 = (title_cost).range(of: title_cost as String)
        titleString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange , range: range2)
        titleString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: range2)
        
        costString.append(titleString)
        view.value_title.attributedText = costString
        view.value_title.numberOfLines = 2
        view.value_title.frame.size.height = view.value_title.frame.size.height + 30
        
        let cost2: NSString = defaultLocalizer.stringForKey(key: "behind") as NSString
        let range2_1 = (cost2).range(of: cost2 as String)
        let costString2 = NSMutableAttributedString.init(string: cost2 as String)
        costString2.addAttribute(NSAttributedString.Key.foregroundColor, value: colorBlackWhite , range: range2_1)
        costString2.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], range: range2_1)
        
        let title_cost2 = " " + packet_sum + " " + defaultLocalizer.stringForKey(key: "tjs")  as NSString
        let titleString2 = NSMutableAttributedString.init(string: title_cost2 as String)
        let range2_2 = (title_cost2).range(of: title_cost2 as String)
        titleString2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange , range: range2_2)
        titleString2.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: range2_2)
        
        let title_cost2_1 = "?" as NSString
        let titleString2_1 = NSMutableAttributedString.init(string: title_cost2_1 as String)
        let range2_3 = (title_cost2_1).range(of: title_cost2_1 as String)
        titleString2_1.addAttribute(NSAttributedString.Key.foregroundColor, value: colorBlackWhite , range: range2_3)
        titleString2_1.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], range: range2_3)
        
        titleString2.append(titleString2_1)
        costString2.append(titleString2)
        
        view.number_title.attributedText = costString2
        view.number_title.frame.origin.y = view.number_title.frame.origin.y + 20
        
        let cost3: NSString = "\(defaultLocalizer.stringForKey(key: "Service_cost")): " as NSString
        let range3 = (cost3).range(of: cost3 as String)
        let costString3 = NSMutableAttributedString.init(string: cost3 as String)
        costString3.addAttribute(NSAttributedString.Key.foregroundColor, value: darkGrayLight , range: range3)
        costString3.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], range: range3)
        
        var title_cost3 = " " + packet_tax + " " + defaultLocalizer.stringForKey(key: "tjs") as NSString
            
        let titleString3 = NSMutableAttributedString.init(string: title_cost3 as String)
        let range3_1 = (title_cost3).range(of: title_cost3 as String)
        titleString3.addAttribute(NSAttributedString.Key.foregroundColor, value: darkGrayLight , range: range3_1)
        titleString3.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: range3_1)
        
        costString3.append(titleString3)
        view.cost_title.attributedText = costString3
        view.cost_title.frame.origin.y = view.cost_title.frame.origin.y + 20
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissDialog))
        view.name.isUserInteractionEnabled = true
        view.name.addGestureRecognizer(tapGestureRecognizer)
        
        view.ok.setTitle(defaultLocalizer.stringForKey(key: "Connect"), for: .normal)
        
        view.cancel.addTarget(self, action: #selector(cancelDialog), for: .touchUpInside)
        view.ok.addTarget(self, action: #selector(okClickDialog), for: .touchUpInside)
        alert.view.backgroundColor = .clear
        alert.view.addSubview(view)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    @objc func requestAnswer(status: Bool, message: String) {
        
        hideActivityIndicator(uiView: view)
        
        alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n\n", message: "", preferredStyle: .alert)
        let widthConstraints = alert.view.constraints.filter({ return $0.firstAttribute == .width })
        alert.view.removeConstraints(widthConstraints)
        // Here you can enter any width that you want
        let newWidth = UIScreen.main.bounds.width * 0.90
        // Adding constraint for alert base view
        let widthConstraint = NSLayoutConstraint(item: alert.view,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1,
                                                     constant: newWidth)
        alert.view.addConstraint(widthConstraint)
        
        let view = AlertView()

        view.backgroundColor = alertColor
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 40, height: 350)
        view.layer.cornerRadius = 20
        if status == true {
            view.name.text = defaultLocalizer.stringForKey(key: "packet_paid")
            view.image_icon.image = UIImage(named: "correct_alert")
            view.ok.addTarget(self, action: #selector(okTrueDialog), for: .touchUpInside)
            view.cancel.addTarget(self, action: #selector(okTrueDialog), for: .touchUpInside)
        }
        else {
            view.name.text = defaultLocalizer.stringForKey(key: "error_title")
            view.image_icon.image = UIImage(named: "uncorrect_alert")
            view.ok.addTarget(self, action: #selector(dismissDialog), for: .touchUpInside)
            view.cancel.addTarget(self, action: #selector(dismissDialog), for: .touchUpInside)
        }
        
        view.name_content.text = "\(message)"
        view.ok.setTitle("OK", for: .normal)
        
        alert.view.backgroundColor = .clear
        alert.view.addSubview(view)
        //alert.view.sendSubviewToBack(view)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func okTrueDialog(_ sender: UIButton) {
        zero_but_open = true
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelDialog() {
        alert.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissDialog() {
        alert.dismiss(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func okClickDialog(_ sender: UIButton) {
        
        zero_but_open = true
        alert.dismiss(animated: true, completion: nil)
        showActivityIndicator(uiView: view)
        print(sender.tag)
        
         let client = APIClient.shared
             do{
               try client.postCreditRequestID(parametr: packet_id).subscribe(
                 onNext: { [self] result in
                   print(result)
                     DispatchQueue.main.async {
                         if result.success == true {
                             requestAnswer(status: true, message: String(result.message ?? ""))
                         }
                         else {
                             requestAnswer(status: false, message: String(result.message ?? ""))
                         }
                     }
                    
                 },
                 onError: { [self] error in
                     DispatchQueue.main.async { [self] in
                         hideActivityIndicator(uiView: self.view)
                         requestAnswer(status: false, message: defaultLocalizer.stringForKey(key: "service is temporarily unavailable"))
                     }
                 },
                 onCompleted: { [self] in
                     DispatchQueue.main.async {
                         hideActivityIndicator(uiView: view)
                     }
                    print("Completed event.")
                     
                 }).disposed(by: disposeBag)
               }
               catch{
            }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

class ZeroButtonView: UIView {
    
    lazy var type_paket: UILabel = {
         let title = UILabel()
         title.text = "Пакет 3 сомони"
         title.numberOfLines = 0
         title.textColor = colorBlackWhite
         title.font = UIFont.boldSystemFont(ofSize: 20)
         title.lineBreakMode = NSLineBreakMode.byWordWrapping
         title.textAlignment = .left
         title.frame = CGRect(x: 20, y: 20, width: 300, height: 20)
         title.autoresizesSubviews = true
         title.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         return title
     }()
     
     lazy var title_commission: UILabel = {
         let title = UILabel()
         title.text = "Стоимость услуги: 0.2 сомони"
         title.numberOfLines = 0
         title.textColor = .orange
         title.font = UIFont(name: "", size: 9)
         title.lineBreakMode = NSLineBreakMode.byWordWrapping
         title.textAlignment = .left
         title.frame = CGRect(x: 20, y: 45, width: 300, height: 20)
         title.autoresizesSubviews = true
         title.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         return title
     }()
     
     lazy var summa: UILabel = {
         let title = UILabel()
         title.text = "Итого:: 0.2 сомони"
         title.numberOfLines = 0
         title.textColor = .orange
         title.font = UIFont(name: "", size: 9)
         title.lineBreakMode = NSLineBreakMode.byWordWrapping
         title.textAlignment = .left
         title.frame = CGRect(x: 20, y: 70, width: 300, height: 20)
         title.autoresizesSubviews = true
         title.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         return title
     }()
     
     lazy var sendButton: UIButton = {
         let button = UIButton(frame: CGRect(x: 40, y: 110, width: Int(UIScreen.main.bounds.size.width) - 80, height: 40))
         //ReconnectBut.setImage(#imageLiteral(resourceName: "connect"), for: UIControl.State.normal)
         //openmenu.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)
         button.backgroundColor = UIColor(red: 1.00, green: 0.50, blue: 0.05, alpha: 1.00)
         button.setTitle(defaultLocalizer.stringForKey(key: "Purchase_package"), for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
         button.layer.cornerRadius = button.frame.height / 2
         return button
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
        backgroundColor = contentColor
    
        addSubview(type_paket)
        addSubview(title_commission)
        addSubview(summa)
        addSubview(sendButton)

    }
}
