//
//  PlaySoundsViewController.swift
//  Pitch perfect
//
//  Created by Sukriku on 03/10/2017.
//  Copyright © 2017 Vedarth Solutions. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    //Mark: view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    //Mark: View did appear function
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureUI(.notPlaying)
    }
    
    //Mark: view will appear function
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    enum ButtonType: Int {case slow = 0, fast, chipmunk, vader, echo, reverb}
    
    //Mark: play sound for button
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch (ButtonType(rawValue: sender.tag)!) {
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
    
    //Mark: stop audio function
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
    }
}
