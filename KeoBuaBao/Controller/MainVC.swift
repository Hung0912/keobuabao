//
//  MainVC.swift
//  KeoBuaBao
//
//  Created by LTT on 7/31/18.
//  Copyright © 2018 Hung. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var mayImg1: UIImageView!
    @IBOutlet weak var mayImg2: UIImageView!
    @IBOutlet weak var mayImg3: UIImageView!
    
    @IBOutlet weak var banImg1: UIImageView!
    @IBOutlet weak var banImg2: UIImageView!
    @IBOutlet weak var banImg3: UIImageView!
    
    @IBOutlet weak var banScoreLbl: UILabel!
    @IBOutlet weak var mayScoreLbl: UILabel!
    
    @IBOutlet weak var keoBtn: UIButton!
    @IBOutlet weak var buaBtn: UIButton!
    @IBOutlet weak var baoBtn: UIButton!
    
    @IBOutlet weak var playBtn: UIButton!

    var select = [selection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banScoreLbl.text = "0"
        mayScoreLbl.text = "0"
        playBtn.isEnabled = false

        
    }
    
    @IBAction func keoPressed(_ sender: UIButton) {
        let s1 = selection(id: select.count + 1 , chon: "keo")
        select.append(s1)
        
        
        switch select.count {
        case 1:
            banImg1.image = UIImage(named: "keo")
        case 2:
            banImg2.image = UIImage(named: "keo")
        default:
            banImg3.image = UIImage(named: "keo")
        }
        
        sender.isEnabled = false
        checkPlayable()
    }
    
    @IBAction func buaPressed(_ sender: Any) {
        let s2 = selection(id: select.count + 1 , chon: "bua")
        select.append(s2)
        
        switch select.count {
        case 1:
            banImg1.image = UIImage(named: "bua")
        case 2:
            banImg2.image = UIImage(named: "bua")
        default:
            banImg3.image = UIImage(named: "bua")
        }
        
        (sender as? UIButton)!.isEnabled = false
        checkPlayable()
        
    }
    
    @IBAction func baoPressed(_ sender: UIButton) {
        let s3 = selection(id: select.count + 1 , chon: "bao")
        select.append(s3)
        
        switch select.count {
        case 1:
            banImg1.image = UIImage(named: "bao")
        case 2:
            banImg2.image = UIImage(named: "bao")
        default:
            banImg3.image = UIImage(named: "bao")
        }
        
        
        sender.isEnabled = false
        
        checkPlayable()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        if select.count > 0 {
            
            let s = select.last!.chon
            select.removeLast()
            
            switch s {
            case "bao":
                baoBtn.isEnabled = true
            case "keo":
                keoBtn.isEnabled = true
            default:
                buaBtn.isEnabled = true
                
            }
            
            
            switch select.count {
            case 1:
                banImg2.image = UIImage(named: "questionmask")
            case 2:
                banImg3.image = UIImage(named: "questionmask")
            default:
                banImg1.image = UIImage(named: "questionmask")
            }
        }
        
        checkPlayable()
        
    }
    
    @IBAction func choiPressed(_ sender: Any) {
        
        randomSelection()
        scoreCaculate()
        
    }
    
    func scoreCaculate() {
        var mayScore: Int = 0
        var nguoiScore: Int = 0
        if (gameLogic(a: mayImg1, b: banImg1) == 1)  {
            mayScore += 1
        } else if gameLogic(a: mayImg1, b: banImg1) == -1 {
            nguoiScore += 1
        }
        
        if (gameLogic(a: mayImg2, b: banImg2) == 1)  {
            mayScore += 1
        } else if gameLogic(a: mayImg2, b: banImg2) == -1 {
            nguoiScore += 1
        }
        
        if (gameLogic(a: mayImg3, b: banImg3) == 1)  {
            mayScore += 1
        } else if gameLogic(a: mayImg3, b: banImg3) == -1 {
            nguoiScore += 1
        }
        mayScoreLbl.text = "\(mayScore)"
        banScoreLbl.text = "\(nguoiScore)"
    }
    
    func randomSelection() {
        var list = ["bua","keo","bao"]
        let random1 = list[Int(arc4random_uniform(UInt32(list.count)))]
        print("1")
        for i in 0..<list.count {
            if list[i] == random1 {
                list.remove(at: i)
                break
            }
        }

        let random2 = list[Int(arc4random_uniform(UInt32(list.count)))]
        for index in 0..<list.count {
            if list[index] == random2 {
                list.remove(at: index)
                break
            }
        }
        let random3 = list[0]

        mayImg1.image = UIImage(named: random1)
        mayImg2.image = UIImage(named: random2)
        mayImg3.image = UIImage(named: random3)
        
    }
    
    // ham logic nhan 2 UIimageview : neu image1 thang image 2 return 1, nguoc lai return -1, hoa return 0
    func gameLogic (a: UIImageView, b: UIImageView) -> Int {
        
        if (a.image == UIImage(named: "keo") && b.image == UIImage(named: "bua")) || (a.image == UIImage(named: "bua") && b.image == UIImage(named: "bao")) || (a.image == UIImage(named: "bao") && b.image == UIImage(named: "keo")) {
            return -1
        } else if (a.image == UIImage(named: "keo") && b.image == UIImage(named: "bao")) || (a.image == UIImage(named: "bua") && b.image == UIImage(named: "keo")) || (a.image == UIImage(named: "bao") && b.image == UIImage(named: "bua")) {
            return 1
        } else {
            return 0
        }
        
    }
    
    func checkPlayable() {
        if select.count == 3 {
            if playBtn.isEnabled == false {
                playBtn.isEnabled = true
            }
        } else {
            if playBtn.isEnabled == true {
                playBtn.isEnabled = false
            }
        }
    }
}
