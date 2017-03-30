//
//  ViewController.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/21/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import RealmSwift
import Realm

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
    var usrInfo:Results<LocalUser>?
    var usrname:String?
    var usrimgurl:String?
    let realm = try! Realm()
    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorphoto: UIImageView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var botImageView: UIImageView!
    @IBOutlet weak var shoeImageView: UIImageView!

    //testUse
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        suit=Array<Suit>()
        
        
        //load from server, take 20 a time
        usrInfo = loadUserInfo()
        updateAuthorInfo()
        setImgRound(img:authorphoto)
        var suitA = Suit(cloth: topa!,pant: bota!,shoes: shoea!)
        var suitB = Suit(cloth: topb!,pant: botb!,shoes: shoeb!)
        var suitC = Suit(cloth: topc!,pant: botc!,shoes: shoec!)
        suit.append(suitA)
        suit.append(suitB)
        suit.append(suitC)
        updateView(idx: counter)
        
        //add gesture recognizer for swiping left/right
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipe(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipe(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    //swipe functioning
    func swipe(_ recognizer:UISwipeGestureRecognizer){
        if recognizer.direction == .left{
            preUpdateView(dir:"right")

        }else if recognizer.direction == .right{
            preUpdateView(dir:"left")
        }
        //the start point of swipe
        let point=recognizer.location(in: self.view)
    }
    
    //return the current logged in user's info
    func loadUserInfo()->Results<LocalUser> {
        return self.realm.objects(LocalUser.self)
    }
    
    //update the author of suit on top bar
    func updateAuthorInfo(){
        authorName.text = usrInfo![0].usrfirstname+usrInfo![0].usrlastname
        if let url = NSURL(string: usrInfo![0].usrpicurl) {
            if let data = NSData(contentsOf: url as URL) {
                authorphoto.image = UIImage(data: data as Data)
            }        
        }
    }
    
    //modify imgview to round
    func setImgRound(img: UIImageView){
        img.layer.borderWidth=0
        img.layer.masksToBounds=false
        img.layer.cornerRadius = authorphoto.frame.width/2
        img.clipsToBounds=true
    }
    
    //left side menu button click
    @IBAction func menuClick(_ sender: Any) {
        //test logout
        print("aa")
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        FBSDKAccessToken.setCurrent(nil)
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    //next suit button click
    @IBAction func nextButtonClick(_ sender: Any) {
        preUpdateView(dir:"right")
    }
    
    //last suit button click
    @IBAction func lastButtonClick(_ sender: Any) {
        preUpdateView(dir:"left")
    }

    //go to author's personal page
    //show fans, past productions,etc
    @IBAction func authorPage(_ sender: Any) {
        print("author page button clicked")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //update the index of current suit show in cache
    func preUpdateView(dir:String){
        if dir=="right"{
            counter+=1
            if counter>=suit.count{
                counter=0
            }
            updateView(idx: counter)
        }
        if dir=="left"{
            counter-=1
            if counter<0{
                counter=suit.count-1
            }
            updateView(idx: counter)
        }
    }

    //update the view
    func updateView(idx:Int){
        topImageView.image = suit[idx].top?.itemImage
        botImageView.image = suit[idx].bot?.itemImage
        shoeImageView.image = suit[idx].shoe?.itemImage
    }
}

