//
//  ViewController.swift
//  Saaditya
//
//  Created by Neosoft1 on 05/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgimage: UIImageView!
    
    @IBOutlet weak var saad: UIButton!
    
    @IBOutlet weak var aditya: UIButton!
    
    @IBOutlet weak var reply: UILabel!
    
    @IBOutlet weak var selectAnimation: UIButton!
    
    
    @IBOutlet var animations: [UIButton]!
    
    var selectedAnimation: String = "fade"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saad.layer.cornerRadius = saad.frame.height / 1.5
        saad.clipsToBounds = true
        aditya.layer.cornerRadius = aditya.frame.height / 1.5
        aditya.clipsToBounds = true
        reply.layer.cornerRadius = reply.frame.height / 1.5
        reply.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    func dropdownManager(){
        animations.forEach { (Button)
            in
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
        saad.backgroundColor = selectedcolor
        aditya.backgroundColor = selectedcolor
        reply.textColor = selectedcolor
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
    
    @IBAction func rippleEffectAnimation(_ sender: UIButton) {
        selectedAnimation = "reveal"
        dropdownManager()
        setColors()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if reply.text != ""{
            reply.backgroundColor = UIColor.white
        }
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func saadTapped(_ sender: Any) {
        
        let selectionVc = storyboard?.instantiateViewController(withIdentifier: "Saadityabg") as? Saadityabg
        selectionVc?.imgName = "saad"
        selectionVc?.selectedAnimation = selectedAnimation
        navigationController?.pushViewController(selectionVc!, animated: false)
        selectionVc?.replyDelegate = self
//        present(selectionVc!,animated: true,completion: nil)
    }
    
    @IBAction func adityaTapped(_ sender: Any) {
        let selectionVc = storyboard?.instantiateViewController(withIdentifier: "Saadityabg") as? Saadityabg
        selectionVc?.imgName = "aditya"
        selectionVc?.selectedAnimation = selectedAnimation
        navigationController?.pushViewController(selectionVc!, animated: false)
        selectionVc?.replyDelegate = self
//        present(selectionVc!,animated: true,completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = CATransitionType(rawValue: selectedAnimation)
        transition.subtype = .fromRight
        
        navigationController?.view.layer.add(transition, forKey: nil)
    }
    
}

extension ViewController : replyDelegate{
    func setReply(reply: String) {
        if reply != ""{
            self.reply.text = "Abhi \(reply) ko dekhke aaya"
        }
        
    }
}
