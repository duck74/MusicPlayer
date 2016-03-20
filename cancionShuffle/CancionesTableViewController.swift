//
//  CancionesTableViewController.swift
//  cancionShuffle
//
//  Created by Koss on 18/03/16.
//  Copyright © 2016 mine. All rights reserved.
//

import UIKit

class CancionesTableViewController: UITableViewController {

    //var canciones: [String] = ["We", "Heart", "Swift", "a lot"]
    
    let lista = Cancion()
    var listaCanciones = [Canciones]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        listaCanciones = lista.crearCanciones()
        //print(listaCanciones)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listaCanciones.count;
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = listaCanciones[indexPath.row].titulo + " - " + listaCanciones[indexPath.row].nombreArtista
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tocar" {
            let play = segue.destinationViewController as! CancionViewController
            let selCancion = self.tableView.indexPathForSelectedRow
            print(selCancion!.row)
            //send song id
            play.selCancion = selCancion!.row
            play.titulo = listaCanciones[(selCancion?.row)!].nombreArtista + " - " + listaCanciones[selCancion!.row].titulo
            print(listaCanciones[(selCancion?.row)!].imagen)
            play.imagen = listaCanciones[(selCancion?.row)!].imagen
            play.sonidoURL = listaCanciones[(selCancion?.row)!].song
            play.listaCanciones = listaCanciones
            play.shuffleMode = false
            
        }
        if segue.identifier == "shuffle" {
            let play = segue.destinationViewController as! CancionViewController
            //send song id
            let selCancion = Int(arc4random_uniform(UInt32(listaCanciones.count)))
            play.titulo = listaCanciones[selCancion].nombreArtista + " - " + listaCanciones[selCancion].titulo
            play.imagen = listaCanciones[selCancion].imagen
            play.sonidoURL = listaCanciones[selCancion].song
            play.selCancion = selCancion
            play.listaCanciones = listaCanciones
            play.shuffleMode = true
            print(selCancion)
        }
        
    }
    

}








