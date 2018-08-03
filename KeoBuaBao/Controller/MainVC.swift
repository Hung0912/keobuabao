//
//  MainVC.swift
//  KeoBuaBao
//
//  Created by LTT on 7/31/18.
//  Copyright © 2018 Hung. All rights reserved.
//

import UIKit
import RealmSwift


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
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var yourResultLabel: UILabel!
    @IBOutlet weak var comResultLabel: UILabel!
    
    var select = [selection]()
    var histories = [History]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
       
    }
    
    func initView(){
        
        banScoreLbl.text = "0"
        mayScoreLbl.text = "0"
        playBtn.isEnabled = false
        yourResultLabel.isHidden = true
        comResultLabel.isHidden = true
        buaBtn.isEnabled = true
        baoBtn.isEnabled = true
        keoBtn.isEnabled = true
        mayImg1.image = GameImage.question
        mayImg2.image = GameImage.question
        mayImg3.image = GameImage.question
        banImg1.image = GameImage.question
        banImg2.image = GameImage.question
        banImg3.image = GameImage.question
        select.removeAll()
    }
    
    @IBAction func keoPressed(_ sender: UIButton) {
        let s1 = selection(id: select.count + 1 , chon: "keo")
        select.append(s1)
        
        
        switch select.count {
        case 1:
            banImg1.image = GameImage.keo
        case 2:
            banImg2.image = GameImage.keo
        default:
            banImg3.image = GameImage.keo
        }
        
        sender.isEnabled = false
        checkPlayPressable()
    }
    
    @IBAction func buaPressed(_ sender: UIButton) {
        let s2 = selection(id: select.count + 1 , chon: "bua")
        select.append(s2)
        
        switch select.count {
        case 1:
            banImg1.image = GameImage.bua
        case 2:
            banImg2.image = GameImage.bua
        default:
            banImg3.image = GameImage.bua
        }

        sender.isEnabled = false
        checkPlayPressable()
        
    }
    
    @IBAction func baoPressed(_ sender: UIButton) {
        let s3 = selection(id: select.count + 1 , chon: "bao")
        select.append(s3)
        
        switch select.count {
        case 1:
            banImg1.image = GameImage.bao
        case 2:
            banImg2.image = GameImage.bao
        default:
            banImg3.image = GameImage.bao
        }
        
        
        sender.isEnabled = false
        
        checkPlayPressable()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        if select.count > 0 {
            
            let s = select.last?.chon
            
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
                banImg2.image = GameImage.question
            case 2:
                banImg3.image = GameImage.question
            default:
                banImg1.image = GameImage.question
            }
        }
        
        checkPlayPressable()
        
    }
    
    @IBAction func choiPressed(_ sender: Any) {
        
        randomComputer()
        scoreCaculate()
        
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        initView()
    }
}

// MARK: - Handle logic
extension MainVC {
    
    func gameLogic (a: UIImageView, b: UIImageView) -> Int {
        
        if (a.image == GameImage.keo && b.image == GameImage.bua)
            || (a.image == GameImage.bua && b.image == GameImage.bao)
            || (a.image == GameImage.bao && b.image == GameImage.keo)
        {
            return Result.lose
        } else if (a.image == GameImage.keo && b.image == GameImage.bao)
            || (a.image == GameImage.bua && b.image == GameImage.keo)
            || (a.image == GameImage.bao && b.image == GameImage.bua)
        {
            return Result.win
        } else {
            return Result.draw
        }
    }
    
    func checkPlayPressable() {
//        if select.count == 3 {
//            if playBtn.isEnabled == false {
//                playBtn.isEnabled = true
//            }
//        } else {
//            if playBtn.isEnabled == true {
//                playBtn.isEnabled = false
//            }
//        }
        
        playBtn.isEnabled = select.count == 3
    }
    
    func randomComputer() {
        var list = ["bua","keo","bao"]
        let random1 = list[Int(arc4random_uniform(UInt32(list.count)))]
        for index in 0..<list.count {
            if list[index] == random1 {
                list.remove(at: index)
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
    
    func scoreCaculate() {
        
        var mayScore: Int = 0
        var nguoiScore: Int = 0
        
        if gameLogic(a: mayImg1, b: banImg1) == Result.win  {
            mayScore += 1
        } else if gameLogic(a: mayImg1, b: banImg1) == Result.lose {
            nguoiScore += 1
        }
        
        if gameLogic(a: mayImg2, b: banImg2) == Result.win  {
            mayScore += 1
        } else if gameLogic(a: mayImg2, b: banImg2) == Result.lose {
            nguoiScore += 1
        }
        
        if gameLogic(a: mayImg3, b: banImg3) == 1  {
            mayScore += 1
        } else if gameLogic(a: mayImg3, b: banImg3) == -1 {
            nguoiScore += 1
        }
        mayScoreLbl.text = "\(mayScore)"
        banScoreLbl.text = "\(nguoiScore)"
        if mayScore > nguoiScore {
            comResultLabel.text = "win"
            yourResultLabel.text = "lose"
        } else if mayScore < nguoiScore {
            comResultLabel.text = "lose"
            yourResultLabel.text = "win"
        } else {
            comResultLabel.text = "draw"
            yourResultLabel.text = "draw"
        }
        comResultLabel.isHidden = false
        yourResultLabel.isHidden = false
        
        let history = History()
        history.yourScore = nguoiScore
        history.comScore = mayScore
        
        //add to realm
        try! realm.write {
            realm.add(history)
        }
    }
    
}
