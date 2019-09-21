//
//  RecoredSoundViweController.swift
//PitchPerfect
//
//  Created by نورة . on 01/09/2019.
//  Copyright © 2019 نورة . All rights reserved.
//

import UIKit
import AVFoundation
class RecoredSoundViweController: UIViewController,AVAudioRecorderDelegate {
   override func viewDidLoad() {
        super.viewDidLoad()
        stopRecoredButton.isEnabled = false
    }
    // Simple gkiiiiiiAnimation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.recorecorButton.alpha = 1}
        UIView.animate(withDuration: 1) {
            self.recoredLable.alpha = 1}
        UIView.animate(withDuration: 2) {
            self.stopRecoredButton.alpha = 1}
        
        
    }
    
    
    @IBOutlet weak var recoredLable: UILabel!
    @IBOutlet weak var recorecorButton: UIButton!
    @IBOutlet weak var stopRecoredButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    @IBAction func Stopbutton(_ sender: Any) {
        
        recorecorButton.isEnabled = true
        stopRecoredButton.isEnabled = false
        recoredLable.text = "Tap To Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    @IBAction func RecoredButo(_ sender: Any) {
        recoredLable.text = "Recording in progress "
        stopRecoredButton.isEnabled = true
        recorecorButton.isEnabled = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator:"/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "StopRecored", sender: audioRecorder.url)
        }else {
            print("recording was nor succesful ")
        }
    }
    
    
    
    
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StopRecored"{
            let plySoundVC = segue.destination as! PlaySoundsViewController
            let recoredAudioURL = sender as! URL
            plySoundVC.recordedAudioURL = recoredAudioURL
        }
    }
    
}



