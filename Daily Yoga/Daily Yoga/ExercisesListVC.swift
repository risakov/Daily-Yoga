//
//  ExercisesListVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit

class ExercisesListVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView : UICollectionView!

    var arrExercisesList : [[String:Any]] = [[:]]
    var selectedIndex : NSInteger = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.



        let leftBarbuttonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(self.clickOnBack))

        self.navigationItem.leftBarButtonItem = leftBarbuttonItem


    }

    @objc func clickOnBack()
    {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {

        var strType : String = ""

        if selectedIndex == 0{
            strType = "Classic"
        }
        else if selectedIndex == 1{
            strType = "Abs"
        }
        else if selectedIndex == 2{
            strType = "Butt"
        }
        else if selectedIndex == 3{
            strType = "Leg"
        }
        else if selectedIndex == 4{
            strType = "Arm"
        }
        else{
            strType = "Sleepy Time Stretch"
        }

        self.navigationItem.title = strType

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return arrExercisesList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExercisesCell", for: indexPath)

        let mainView = cell.viewWithTag(1001) as UIView?

        mainView?.setShadowToCellView()

        let dicExercises = arrExercisesList[indexPath.row]

        let lblExercisesName = mainView?.viewWithTag(1002) as! UILabel
        let imgExercises = mainView?.viewWithTag(1003) as! UIImageView

        lblExercisesName.text = (dicExercises["Name"] as? String)?.uppercased()
        imgExercises.image = dicExercises["image"] as? UIImage

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (UIScreen.main.bounds.size.width-30)/2

        return CGSize.init(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    @IBAction func clickOnGO(sender:UIButton)
    {

        let activityVC = self.storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as! ActivityVC

        if selectedIndex == 0{

            let arrayGIF = ["jumping-jacks","wallsit","pushups","abdominal","step-up-chair","squats","triceps-dips","plank","high-stepping","lunges","push-up-&-rotation","right side plank","left side plank"]

            activityVC.arrGIF = arrayGIF

        }
        if selectedIndex == 1{

            let arrayGIF = ["jumping-squats","reverse-crunches","straight arm plank","russian-twist","bird-dog","burpees","long-arm-crunch","one-leg-bridge","one-leg-push-ups","plank","cross-arm-crunches","mountain-climber","bridge","bicycle-crunches"]

            activityVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 2{

            let arrayGIF = ["squats","frogy-gults-lift","lunges","butt-bridge","donkey-kick-left","split-squat-right","fire-hydrent-left","fire-hydrent-right","plie-squats","donkey-kicks-right","sumo-squats-calf-rise","split-squats-left"]

            activityVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 3{

            let arrayGIF = ["calf-rises","cursty-lungs","single-left-leg-calf","side-lungs","left-lung-knee-hopes","single-right-leg-calf","bottom-leg-lift-left","bottom-leg-lift-right","right-lunge-knee-hops","side-leg-circle-left","side-leg-circle-right","backward-lunge-with-front-kick-left","backward-lunge-with-front-kick-right"]

            activityVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 4{

            let arrayGIF = ["side-arm-raise","pushups","triceps-dips","diamond-push-ups","punches","up-&-down-plank","shoulder-strech","arm-circles","reverse-pushups","punches-2","one-leg-pushups","planks-taps","tricep stretch left","tricep stretch right"]

            activityVC.arrGIF = arrayGIF

        }
        else if selectedIndex == 5{

            let arrayGIF = ["kneeling lunge stretch","kneeling lunge stretch right","calf stretch left","calf stretch right","tricep stretch left-1","tricep stretch right-1","cat-cow-pose","cobra stretch","child pose","spine lumber twist stretch left","spine lumber twist stretch right"]

            activityVC.arrGIF = arrayGIF

        }
        activityVC.arrActivity = arrExercisesList
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(activityVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
