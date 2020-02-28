//
//  CompleteVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit

protocol didFinishWithDoitAgain {

    func didFinshWithDoItAgain()

}

class CompleteVC: UIViewController {

    @IBOutlet var lblCongratulations : UILabel!

    var delegate : didFinishWithDoitAgain!

    @IBOutlet weak var btnDoitAgain: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        Blink()
        btnDoitAgain.layer.cornerRadius = btnDoitAgain.frame.height / 2
        btnDoitAgain.clipsToBounds = true
        btnDoitAgain.setShadowToButtonView()
        // Do any additional setup after loading the view.

    }

    func Blink(){
        lblCongratulations.alpha = 0.0
        UIView.animate(withDuration: 2, animations: {
            self.lblCongratulations.alpha = 1.0
        }, completion: {
            (value: Bool) in
            self.Blink()
        })
    }

    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.isHidden = true
    }


    @IBAction func clickOnBack(sender:UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func clickOnDoItAgain(sender:UIButton)
    {
        delegate.didFinshWithDoItAgain()
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
