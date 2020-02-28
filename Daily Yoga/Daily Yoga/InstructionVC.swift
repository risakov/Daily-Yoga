//
//  InstructionVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit

class InstructionVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tblView : UITableView!
    @IBOutlet var adView : UIView!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var arrExercisesList : [[String:Any]] = [[:]]
    var selectedIndex : NSInteger = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tblView.tableFooterView = UIView()


    }



    override func viewWillAppear(_ animated: Bool) {

        var strType : String = ""

        if selectedIndex == 0{
            strType = "Classic Workout"
        }
        else if selectedIndex == 1{
            strType = "Abs Workout"
        }
        else if selectedIndex == 2{
            strType = "Butt Workout"
        }
        else if selectedIndex == 3{
            strType = "Leg Workout"
        }
        else if selectedIndex == 4{
            strType = "Arm Workout"
        }
        else{
            strType = "Sleepy Time Stretch Workout"
        }

        self.navigationItem.title = strType

    }

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrExercisesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        let dicExercises = arrExercisesList[indexPath.row]

        cell.lblName.text = (dicExercises["Name"] as? String)?.uppercased()
        cell.imgYoga.image = dicExercises["image"] as? UIImage

        cell.mainView.setShadowToCellView()
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 90
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let instructionDetailVC: InstructionDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "InstructionDetailVC") as! InstructionDetailVC


        if selectedIndex == 0{

            let arrayGIF = ["jumping-jacks","wallsit","pushups","abdominal","step-up-chair","squats","triceps-dips","plank","high-stepping","lunges","push-up-&-rotation","right side plank","left side plank"]

            instructionDetailVC.arrGIF = arrayGIF

        }
        if selectedIndex == 1{

            let arrayGIF = ["jumping-squats","reverse-crunches","straight arm plank","russian-twist","bird-dog","burpees","long-arm-crunch","one-leg-bridge","one-leg-push-ups","plank","cross-arm-crunches","mountain-climber","bridge","bicycle-crunches"]

            instructionDetailVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 2{

            let arrayGIF = ["squats","frogy-gults-lift","lunges","butt-bridge","donkey-kick-left","split-squat-right","fire-hydrent-left","fire-hydrent-right","plie-squats","donkey-kicks-right","sumo-squats-calf-rise","split-squats-left"]

            instructionDetailVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 3{

            let arrayGIF = ["calf-rises","cursty-lungs","single-left-leg-calf","side-lungs","left-lung-knee-hopes","single-right-leg-calf","bottom-leg-lift-left","bottom-leg-lift-right","right-lunge-knee-hops","side-leg-circle-left","side-leg-circle-right","backward-lunge-with-front-kick-left","backward-lunge-with-front-kick-right"]

            instructionDetailVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 4{

            let arrayGIF = ["side-arm-raise","pushups","triceps-dips","diamond-push-ups","punches","up-&-down-plank","shoulder-strech","arm-circles","reverse-pushups","punches-2","one-leg-pushups","planks-taps","tricep stretch left","tricep stretch right"]

            instructionDetailVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 5{

            let arrayGIF = ["kneeling lunge stretch","kneeling lunge stretch right","calf stretch left","calf stretch right","tricep stretch left-1","tricep stretch right-1","cat-cow-pose","cobra stretch","child pose","spine lumber twist stretch left","spine lumber twist stretch right"]

            instructionDetailVC.arrGIF = arrayGIF

        }

        self.navigationItem.title = ""
        instructionDetailVC.arrExercisesList = arrExercisesList
        instructionDetailVC.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(instructionDetailVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

extension UIView {
    func setShadowToCellView() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.1
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
    }

}

extension UIButton {
    func setShadowToButtonView() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
    }

}
