//
//  playSuondViewController.swift
//  PitchPerfect
//
//  Created by نورة . on 02/09/2019.
//  Copyright © 2019 نورة . All rights reserved.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {
    
    // MARK:Pitch
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    
    
    var playRecored : URL!
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }
       // MARK: Simple Animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.snailButton.alpha = 1}
        UIView.animate(withDuration: 2) {
            self.rabbitButton.alpha = 1}
        UIView.animate(withDuration: 3) {
            self.chipmunkButton.alpha = 1}
        UIView.animate(withDuration: 4) {
            self.vaderButton.alpha = 1}
        UIView.animate(withDuration: 5) {
            self.echoButton.alpha = 1}
        UIView.animate(withDuration: 6) {
            self.reverbButton.alpha = 1}
        UIView.animate(withDuration: 7) {
            self.stopButton.alpha = 1}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButonPressed(_ sender: AnyObject) {
        setupAudio()
    }
    
}


