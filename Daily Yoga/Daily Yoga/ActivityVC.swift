//
//  ActivityVC.swift
//  Daily Yoga
//
//  Created by Harry on 5/28/19.
//  Copyright © 2019 Ankit Gabani. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityVC: UIViewController,SRCountdownTimerDelegate,didFinishWithSuccess,didFinishWithDoitAgain {

    @IBOutlet var imgView : UIImageView!
    @IBOutlet var lblExerciseTitle : UILabel!
    @IBOutlet var lblStart : UILabel!
    @IBOutlet var lblReadyToGo : UILabel!
    @IBOutlet var counterView : SRCountdownTimer!

    var arrActivity : [[String:Any]] = [[:]]
    var arrGIF : [String] = []
    var currentActivityIndex : NSInteger = 0
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupActivityImage()

        let color =  UIColor.init(red: 55.0/255.0, green: 182.0/255.0, blue: 119.0/255.0, alpha: 1.0)

        counterView.delegate = self
        counterView.lineColor = color
        counterView.lineWidth = 2
        counterView.labelFont = UIFont.boldSystemFont(ofSize: 40)
        counterView.labelTextColor = color
        counterView.start(beginingValue: 30)

        let dictActivity = arrActivity[currentActivityIndex]

        let string = "Ready to go Round 1 of 1 start with \(dictActivity["Name"] as! String)"
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)

        let leftBarbuttonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(self.clickOnBack))

        self.navigationItem.leftBarButtonItem = leftBarbuttonItem

    }

    override func viewWillAppear(_ animated: Bool) {

        self.navigationItem.title = "6 AND A HALF MINUTES"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "info"), style: .plain, target: self, action: #selector(self.clickOnInfo))

        self.navigationController?.navigationBar.isHidden = false
    }

    @objc func clickOnInfo()
    {
        counterView.pause()

        let instructionDetailVC: InstructionDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "InstructionDetailVC") as! InstructionDetailVC

        self.navigationItem.title = ""
        instructionDetailVC.arrExercisesList = arrActivity
        instructionDetailVC.selectedIndex = currentActivityIndex
        instructionDetailVC.arrGIF = arrGIF
        self.navigationController?.pushViewController(instructionDetailVC, animated: true)

    }

    func setupActivityImage()
    {
        let dictActivity = arrActivity[currentActivityIndex]

        let strStep = String.init(format: "%d/%d", currentActivityIndex+1,arrActivity.count)

        lblExerciseTitle.text = "\(strStep) \((dictActivity["Name"] as! String).uppercased())"

        let strImg = arrGIF[currentActivityIndex]

        if let bundleURL = Bundle.main
            .url(forResource: strImg, withExtension: "gif"){
            imgView.image = UIImage.gifImageWithName(strImg)
        }
        else{
            imgView.image = UIImage.init(named: strImg)

        }

    }

    func timerDidEnd() {

        if currentActivityIndex < arrGIF.count-1{
            currentActivityIndex = currentActivityIndex + 1
            self.setupActivityImage()
            counterView.start(beginingValue: 30)
        }
    }
    func timerDidUpdateCounterValue(newValue: Int) {

        if newValue <= 3{

            if newValue == 0
            {
                lblStart.text = "Start with"
                lblStart.isHidden = false
                lblReadyToGo.isHidden = false

                let dictActivity = arrActivity[currentActivityIndex+1]
                let string = "Next \(dictActivity["Name"] as! String)"
            }
            else{
                let string = String.init(format: "%d", newValue)
                let utterance = AVSpeechUtterance(string: string)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            }
        }
        else if newValue == 15
        {
            let utterance = AVSpeechUtterance(string: "half the time")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
        }
    }

    func timerDidPause() {


    }

    func timerDidResume() {


    }

    @IBAction func clickOnshowVideo(sender:UIButton)
    {
        let dictActivity = arrActivity[currentActivityIndex]
        let url = URL.init(string: dictActivity["video"] as! String)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }


    func didFinshWithBack() {

        counterView.resume()
    }

    func didFinshWithNext() {

        if currentActivityIndex < arrActivity.count-1{

            lblStart.text = "Start with"
            lblStart.isHidden = false
            lblReadyToGo.isHidden = false

            let dictActivity = arrActivity[currentActivityIndex+1]
            let string = "Next \(dictActivity["Name"] as! String)"

            currentActivityIndex = currentActivityIndex + 1
            self.setupActivityImage()
            counterView.start(beginingValue: 30)
        }
        else{

            counterView.pause()
            let completeVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteVC") as! CompleteVC
            completeVC.delegate = self
            self.navigationController?.pushViewController(completeVC, animated: true)
        }

    }

    func didFinshWithDoItAgain() {

        counterView.start(beginingValue: 30)
        currentActivityIndex = 0

        self.setupActivityImage()

        let dictActivity = arrActivity[currentActivityIndex]

        let string = "Ready to go Round 1 of 1 start with \(dictActivity["Name"] as! String)"
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)

    }

    func didFinishwithPrevious() {

        if currentActivityIndex > 0{

            lblStart.text = "Start with"
            lblStart.isHidden = false
            lblReadyToGo.isHidden = false


            let dictActivity = arrActivity[currentActivityIndex - 1]
            let string = "Next \(dictActivity["Name"] as! String)"


            currentActivityIndex = currentActivityIndex - 1
            self.setupActivityImage()
            counterView.start(beginingValue: 10)

        }

    }

    @objc func clickOnBack()
    {
        let alertController = UIAlertController.init(title: nil, message: "Are you sure you want to quit this 6 and a half minutes workout?", preferredStyle: .alert)

        let actionCancel = UIAlertAction.init(title: "Cancel", style: .default) { (action) in

            alertController.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(actionCancel)

        let actionOk = UIAlertAction.init(title: "Ok", style: .default) { (action) in

            self.counterView.pause()
            alertController.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
        }

        alertController.addAction(actionOk)

        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func clickOnNext(sender:UIButton)
    {
        self.didFinshWithNext()
    }

    @IBAction func clickOnBackWith(sender:UIButton)
    {
        self.didFinishwithPrevious()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
