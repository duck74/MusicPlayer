//
//  CancionViewController.swift
//  cancionShuffle
//
//  Created by Koss on 18/03/16.
//  Copyright © 2016 mine. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class CancionViewController: UIViewController, AVAudioPlayerDelegate {

    var titulo = ""
    var imagen:UIImage?
    var sonidoURL:NSURL?
    var listaCanciones = [Canciones]()
    
    @IBOutlet weak var volumeControl: UISlider!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var play: UIButton!
    
    @IBOutlet weak var shuffle: UIButton!
    @IBOutlet weak var cancionTitulo: UILabel!

    @IBOutlet weak var cancionImagen: UIImageView!
    
    @IBOutlet weak var sliderValor: UILabel!
    
    var selCancion:Int?
    var shuffleMode:Bool = false
    var reproductor: AVAudioPlayer!
    //var listaCanciones = [Cancion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if shuffleMode == false {
            //shuffle.setTitle("Shuffle Off", forState: UIControlState.Normal)
            shuffle.backgroundColor = UIColor(white: 100, alpha: 1)
            shuffle.selected = false
            shuffle.highlighted = false
            cancionImagen.image = imagen
            cancionTitulo.text = titulo
            do {
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor!.playing {
                    self.reproductor.delegate = self

                    reproductor!.play()
                    play.setImage(UIImage(named: "play_green.png"), forState: UIControlState.Normal)
                }
            }
            catch {
                print("Error a cargar el archivo de sonido")
            }
        }
        else {
            //shuffle.setTitle("Shuffle On", forState: UIControlState.Normal)
            shuffle.highlighted = true
            shuffle.selected = true
            cancionImagen.image = imagen
            cancionTitulo.text = titulo
            do {
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                self.reproductor.delegate = self
                if !reproductor!.playing {
                    reproductor!.play()
                    play.setImage(UIImage(named: "play_green.png"), forState: UIControlState.Normal)
                }
            }
            catch {
                print("Error a cargar el archivo de sonido")
            }
            
        }
    }
    
    func audioPlayerDidFinishPlaying(reproductor: AVAudioPlayer, successfully flag: Bool) {
        
        if shuffleMode == false {
            play.setImage(UIImage(named: "play_black.png"), forState: UIControlState.Normal)
        }
        else if shuffleMode == true {
            shuffleCanciones()
            
            /*let selCancion = Int(arc4random_uniform(UInt32(listaCanciones.count)))
            cancionTitulo.text = listaCanciones[selCancion].nombreArtista + " - " + listaCanciones[selCancion].titulo
            cancionImagen.image = listaCanciones[selCancion].imagen
            do {
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing {
                    reproductor.play()
                    play.setImage(UIImage(named: "play_green.png"), forState: UIControlState.Normal)
                }
            }
            catch {
                print("Error a cargar el archivo de sonido")
            }*/
        }
    }
    
    func shuffleCanciones() {
        
        let selCancion = Int(arc4random_uniform(UInt32(listaCanciones.count)))
        print(selCancion)
        cancionTitulo.text = listaCanciones[selCancion].nombreArtista + " - " + listaCanciones[selCancion].titulo
        cancionImagen.image = listaCanciones[selCancion].imagen
        sonidoURL = listaCanciones[selCancion].song
        print(String(selCancion) + " " + listaCanciones[selCancion].titulo)
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            self.reproductor.delegate = self
            if !reproductor.playing {
                reproductor.play()
                play.setImage(UIImage(named: "play_green.png"), forState: UIControlState.Normal)
            }
        }
        catch {
            print("Error a cargar el archivo de sonido")
        }
    
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func playerDidFinishPlaying(note: NSNotification) {
        
    }*/
    
    @IBAction func toggleShuffle(sender: AnyObject) {
        if shuffle.selected == true { //shuffle.currentTitle == "Shuffle On" {
            shuffleMode = false
            shuffle.selected = false
            shuffle.highlighted = false
            //shuffle.setTitle("Shuffle off", forState: UIControlState.Normal)
        }
        else if shuffle.selected == false { //if shuffle.currentTitle == "Shuffle" {
            shuffleCanciones()
            shuffleMode = true
            shuffle.selected = true
            shuffleMode = true
            //shuffle.setTitle("Shuffle On", forState: UIControlState.Normal)
        }
        else {
            print("hghgh")
        }
        
    }
    
    @IBAction func cancionVolume(sender: AnyObject) {
        //let currentValue = Int(sender.value)
        if reproductor != nil {
            reproductor?.volume = (volumeControl.value / 100.0)
            let val = Int(volumeControl.value)
            sliderValor.text = String(val)
        }
    }

    @IBAction func playAction() {
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerDidFinishPlaying:", name: AVPlayerItemDidPlayToEndTimeNotification, object: reproductor)
        if !reproductor!.playing {
            self.reproductor.delegate = self

            reproductor!.play()
            play.setImage(UIImage(named: "play_green.png"), forState: UIControlState.Normal)
            pause.setImage(UIImage(named: "pause_black.png"), forState: UIControlState.Normal)
            stop.setImage(UIImage(named: "stop_black.png"), forState: UIControlState.Normal)
        }
        
    }
    @IBAction func pauseAction() {
        if reproductor!.playing {
            reproductor!.pause()
            play.setImage(UIImage(named: "play_black.png"), forState: UIControlState.Normal)
            pause.setImage(UIImage(named: "pause_green.png"), forState: UIControlState.Normal)
            stop.setImage(UIImage(named: "stop_black.png"), forState: UIControlState.Normal)
        }
        
    }
    @IBAction func stopAction() {
        if reproductor!.playing {
            reproductor!.stop()
            reproductor?.currentTime = 0.0
            play.setImage(UIImage(named: "play_black.png"), forState: UIControlState.Normal)
            pause.setImage(UIImage(named: "pause_black.png"), forState: UIControlState.Normal)
            stop.setImage(UIImage(named: "stop_green.png"), forState: UIControlState.Normal)
        }
    }
    
    /*deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "playerDidFinishPlaying:", object: reproductor)

    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

