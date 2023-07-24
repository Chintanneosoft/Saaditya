//
//  Saadityabg.swift
//  Saaditya
//
//  Created by Neosoft1 on 05/07/23.
//

import UIKit

protocol replyDelegate{
    func setReply(reply: String)
}


class Saadityabg:
    UIViewController {

    var replyDelegate: replyDelegate?
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgBg: UIImageView!
    
    @IBOutlet weak var selectAnimation: UIButton!
    
    @IBOutlet var animations: [UIButton]!
    var imgName:String?
    var selectedAnimation:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBg.image = UIImage(named: imgName ?? "")
        btnBack.layer.cornerRadius = btnBack.frame.height / 1.5
        btnBack.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    func dropdownManager(){
        animations.forEach { (Button)
            in
//            Button.titleLabel?.isHidden = !(Button.titleLabel?.isHidden ?? true)
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
                
                self.view.layoutIfNeeded()
            })
        }
    }
    func setColors(){
        var selectedcolor:UIColor = UIColor.white
        if selectedAnimation == "fade"{
            selectedcolor = UIColor.systemPink
        }
        else if selectedAnimation == "flip"{
            selectedcolor = UIColor.systemOrange
        }
        else if selectedAnimation == "cube"{
            selectedcolor = UIColor.systemPurple
        }
        else if selectedAnimation == "moveIn"{
            selectedcolor = UIColor.systemYellow
        }
        else if selectedAnimation == "reveal"{
            selectedcolor = UIColor.systemGreen
        }
        btnBack.backgroundColor = selectedcolor
        selectAnimation.backgroundColor = selectedcolor
    }
    @IBAction func selectAnimationTapped(_ sender: UIButton) {
        dropdownManager()
    }
    
    @IBAction func fadeTapped(_ sender: UIButton) {
        selectedAnimation = "fade"
        dropdownManager()
        setColors()
    }
    
    @IBAction func flipTapped(_ sender: UIButton) {
        selectedAnimation = "flip"
        dropdownManager()
        setColors()
    }
    
    @IBAction func cubeTapped(_ sender: UIButton) {
        selectedAnimation = "cube"
        dropdownManager()
        setColors()
    }
    
    @IBAction func suckEffectTapped(_ sender: UIButton) {
        selectedAnimation = "moveIn"
        dropdownManager()
        setColors()
    }
    
    @IBAction func rippleEffectTapped(_ sender: UIButton) {
        selectedAnimation = "reveal"
        dropdownManager()
        setColors()
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        replyDelegate?.setReply(reply: imgName ?? "")
        navigationController?.popViewController(animated: false)
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        transition.type = CATransitionType(rawValue: "flip")
//        transition.subtype = .fromRight
//
//        navigationController?.view.layer.add(transition, forKey: nil)
//    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = CATransitionType(rawValue: selectedAnimation ?? "fade")
        transition.subtype = .fromLeft
        
        navigationController?.view.layer.add(transition, forKey: nil)
    }
}
