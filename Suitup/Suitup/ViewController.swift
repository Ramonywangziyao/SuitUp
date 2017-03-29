//
//  ViewController.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/21/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //testUse
    
    let topa = UIImage(named: "top")
    let bota = UIImage(named: "bot")
    let shoea = UIImage(named: "shoe")
    
    let topb = UIImage(named: "topb")
    let botb = UIImage(named: "botb")
    let shoeb = UIImage(named: "shoeb")
    
    let topc = UIImage(named: "topc")
    let botc = UIImage(named: "botc")
    let shoec = UIImage(named: "shoec")
    var suit:Array<Suit>!
    var counter=0
    @IBOutlet weak var topButtonView: UIButton!
    @IBOutlet weak var botButtonView: UIButton!
    @IBOutlet weak var shoeButtonView: UIButton!
    //testUse
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        suit=Array<Suit>()
        //load from server, take 20 a time
        var suitA = Suit(cloth: topa!,pant: bota!,shoes: shoea!)
        var suitB = Suit(cloth: topb!,pant: botb!,shoes: shoeb!)
        var suitC = Suit(cloth: topc!,pant: botc!,shoes: shoec!)
        suit.append(suitA)
        suit.append(suitB)
        suit.append(suitC)
        updateView(idx: counter)
    }
    @IBAction func nextButtonClick(_ sender: Any) {
        counter+=1
        updateView(idx: counter)
    }
    @IBAction func lastButtonClick(_ sender: Any) {
        counter-=1
        updateView(idx: counter)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView(idx:Int){
        topButtonView.setBackgroundImage(suit[idx].top?.itemImage, for: UIControlState.normal)
        botButtonView.setBackgroundImage(suit[idx].bot?.itemImage, for: UIControlState.normal)
        shoeButtonView.setBackgroundImage(suit[idx].shoe?.itemImage, for: UIControlState.normal)
    }



}

