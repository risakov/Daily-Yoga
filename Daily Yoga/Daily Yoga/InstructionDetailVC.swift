//
//  InstructionDetailVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit

class InstructionDetailVC: UIViewController {

    @IBOutlet var imgView : UIImageView!
    @IBOutlet var lblExercisesName : UILabel!
    @IBOutlet var lblExercisesDetail : UILabel!
    @IBOutlet var scrollView : UIScrollView!

    var arrExercisesList : [[String:Any]] = [[:]]
    var selectedIndex : NSInteger = 0
    var arrGIF : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupDetails()
    }

    func setupDetails()
    {
        let dictActivity = arrExercisesList[selectedIndex]

        lblExercisesName.text = "\((dictActivity["Name"] as! String).uppercased())"

        let strImg = arrGIF[selectedIndex]

        if let bundleURL = Bundle.main
            .url(forResource: strImg, withExtension: "gif"){
            imgView.image = UIImage.gifImageWithName(strImg)
        }
        else{
            imgView.image = UIImage.init(named: strImg)

        }

        lblExercisesDetail.numberOfLines = 0
        lblExercisesDetail.text = "\((dictActivity["description"] as! String))"
        lblExercisesDetail.sizeToFit()

        self.navigationItem.title = lblExercisesName.text
    }

    @IBAction func clickOnNext(sender:UIButton)
    {
        if selectedIndex < arrExercisesList.count-1{

            selectedIndex = selectedIndex + 1
            self.setupDetails()
        }

    }

    @IBAction func clickOnBack(sender:UIButton)
    {
        if selectedIndex > 0{

            selectedIndex = selectedIndex - 1
            self.setupDetails()
        }

    }


    @IBAction func clickOnshowVideo(sender:UIButton)
    {
        let dictActivity = arrExercisesList[selectedIndex]
        let url = URL.init(string: dictActivity["video"] as! String)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
