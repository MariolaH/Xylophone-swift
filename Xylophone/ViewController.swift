//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //This declares a property named player of type AVAudioPlayer
    //The ! indicates that this variable is an implicitly unwrapped optional, by adding the exclamation mark !, you are asserting that the optional definitely contains a value and not nil
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //identy of the button that is tapped gets sent over to this func that it triggers inside this input.
    //sender in the terminal shows all info for the button that was pressed ie, title, color, tag
    //sender: UIButton - we know sender is a button - C, D, E, F, G, A, B
    @IBAction func KeyPressed(_ sender: UIButton) {
        // It retrieves the title (text) of the button that was pressed with sender.currentTitle! and passes it to the playSound function.
        print(" The butto title is: \(sender.title(for: .normal))")
        //If click on the C button, sender.CurrentTitle will be equal to C
        playSound(soundName: sender.currentTitle!)
        //this make the buttons opacity that was pressed half its color
        sender.alpha = 0.5
        print("start")
        //creates a 3 second delay, after 3 seconds the code in the block is executed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            print("end")
            //brings opacity back to full color after 3 seconds
            sender.alpha = 1
        }
    }
    
    //This function takes a soundName parameter (a string) and attempts to locate a file with that name and a "wav" extension in the app's main bundle (its resources).
    //C becomes the soundName
    func playSound(soundName: String) {
        //use soundName that gets passed in, soundName can be anyone titles of the buttons
        //C gets put in the soundName place, forResource: soundName... then plays C.wave
         let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //an attempt is made to initialize a new instance of AVAudioPlayer using the initializer init(contentsOf:)
        //The init(contentsOf:) initializer is designed to create a new audio player instance from the contents of a specified URL
        //In Swift, you use the try keyword when calling a function or initializer that can throw an error. By using try! (with an exclamation mark), you are force-trying. This means you're telling Swift that you're sure this operation won't throw an error.
         player = try! AVAudioPlayer(contentsOf: url!)
         player.play()
                 
     }
}

