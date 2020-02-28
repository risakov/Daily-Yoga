//
//  PauseVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit

protocol didFinishWithSuccess {

    func didFinshWithBack()
    func didFinshWithNext()
    func didFinishwithPrevious()
}

class PauseVC: UIViewController {

    @IBOutlet var lblExercises : UILabel!

    var strExercisesName : String = ""

    var delegate : didFinishWithSuccess!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        lblExercises.text = strExercisesName.uppercased()
    }

    @IBAction func clickOnNext(sender:UIButton)
    {
        delegate.didFinshWithNext()
        self.dismiss(animated: false, completion: nil)

    }

    @IBAction func clickOnPrevious(sender:UIButton)
    {
        delegate.didFinishwithPrevious()
        self.dismiss(animated: false, completion: nil)

    }

    @IBAction func clickOnPlay(sender:UIButton)
    {
        delegate.didFinshWithBack()
        self.dismiss(animated: false, completion: nil)

    }

    @IBAction func clickOnBack(sender:UIButton)
    {
        delegate.didFinshWithBack()
        self.dismiss(animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
