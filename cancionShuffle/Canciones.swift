//
//  Canciones.swift
//  cancionShuffle
//
//  Created by Koss on 18/03/16.
//  Copyright © 2016 mine. All rights reserved.
//

import Foundation
import UIKit

struct Canciones {
    var titulo:String
    var nombreArtista: String
    var imagen: UIImage
    var song: NSURL //().URLForResource("Spain", withExtension: "m4a")
    init (titulo:String, nombreArtista:String, imagen:UIImage, song: NSURL) {
        self.titulo = titulo
        self.nombreArtista = nombreArtista
        self.imagen = imagen
        self.song = song
    }
    
}

class Cancion {

var listaCanciones = [Canciones]()

let gorillazImage = UIImage(named: "Gorillaz.jpg")
let toadiesImage = UIImage(named: "Toadies.jpg")
let gogolImage = UIImage(named: "Gogol.jpg")
let euroImage = UIImage(named: "Eurythmics.jpg")
let gogolURL = NSBundle.mainBundle().URLForResource("60_Revolutions", withExtension: "m4a")
let gorillazURL = NSBundle.mainBundle().URLForResource("Clint_Eastwood", withExtension: "m4a")
let toadiesURL = NSBundle.mainBundle().URLForResource("Mexican_Hairless", withExtension: "m4a")
let euroURL = NSBundle.mainBundle().URLForResource("There_must_be_an_angel", withExtension: "m4a")

    func crearCanciones() -> [Canciones] {
        self.listaCanciones.append(Canciones(titulo: "60 Revolutions", nombreArtista: "Gogol Bordello", imagen: gogolImage!, song: gogolURL!))
        self.listaCanciones.append(Canciones(titulo: "Clint Eastwood", nombreArtista: "Gorillaz", imagen: gorillazImage!, song: gorillazURL!))
        self.listaCanciones.append(Canciones(titulo: "Mexican Hairless", nombreArtista: "Toadies", imagen: toadiesImage!, song: toadiesURL!))
        self.listaCanciones.append(Canciones(titulo: "There must be an angel", nombreArtista: "Eurythmics", imagen: euroImage!, song: euroURL!))
        return listaCanciones
    }


//self.listaCanciones.append(Canciones(titulo: "60 Revolutions", nombreArtista: "Gogol Bordello", imagen: gogolImage, song: gogolURL))
    
}



