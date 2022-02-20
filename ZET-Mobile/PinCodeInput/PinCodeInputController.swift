//
//  PinCodeInputController.swift
//  ZET-Mobile
//
//  Created by ScrumTJ on 1/9/22.
//

import UIKit

class PinCodeInputController: UIViewController , UIScrollViewDelegate {
    
    let defaultLocalizer = AMPLocalizeUtils.defaultLocalizer
    
    var toolbar = Toolbar()
    var pincode_view = PinCodeView()
    
    var enterPlace = [UIView()]
    var clickTime = 1
    var pas = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
  
        toolbar = Toolbar(frame: CGRect(x: 0, y: 44, width: UIScreen.main.bounds.size.width, height: 60))
        pincode_view = PinCodeView(frame: CGRect(x: 0, y: 104, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        toolbar.openmenu.isHidden = true
        enterPlace.append(pincode_view.number1)
        enterPlace.append(pincode_view.number2)
        enterPlace.append(pincode_view.number3)
        enterPlace.append(pincode_view.number4)
        
        let buttons = getButtonsInView(view: pincode_view)
        for button in buttons {
            button.addTarget(self, action: #selector(clickButton(sender:)), for: .touchUpInside)
        }
        
        toolbar.icon_more.isHidden = true
        
        self.view.addSubview(toolbar)
        self.view.addSubview(pincode_view)
        
        toolbar.backgroundColor = .white
      
    }
    
    @objc func clickButton(sender: UIButton){
        print(sender.titleLabel?.text)
       
        sender.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        
        UIButton.animate(withDuration: 1, animations: { [] () -> Void in
            sender.backgroundColor = UIColor.clear
        })
        
        enterPlace[clickTime].backgroundColor = UIColor.orange
        clickTime = clickTime + 1
        pas = pas + sender.title(for: UIControl.State.normal)!
        
        if (clickTime == 5) {
            print(pas)
          if (pas == "1234") {
            clickTime = 1
            pas = ""
            
            print("dd")
            enterPlace[1].backgroundColor = UIColor.green
            enterPlace[2].backgroundColor = UIColor.green
            enterPlace[3].backgroundColor = UIColor.green
            enterPlace[4].backgroundColor = UIColor.green
         }
          else {
            clickTime = 1
            pas = ""
            enterPlace[1].backgroundColor = UIColor.red
            enterPlace[2].backgroundColor = UIColor.red
            enterPlace[3].backgroundColor = UIColor.red
            enterPlace[4].backgroundColor = UIColor.red
          }
            
      }

    }
}
