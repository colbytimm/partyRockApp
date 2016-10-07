//
//  ViewController.swift
//  partyRockApp
//
//  Created by Colby Timm on 2016-10-06.
//  Copyright © 2016 Colby Timm. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://albumarter.files.wordpress.com/2016/01/coldplay-album-art.jpg?w=620", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YykjpeuMNEk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hymn For The Weekend")
       
        let p2 = PartyRock(imageURL: "https://s-media-cache-ak0.pinimg.com/564x/56/5b/4f/565b4f1c9f666d113c9352605e212aa6.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/VPRjCeoBqrI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "A Sky Full Of Stars")
        
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/e/e9/Coldplay,_Up%26Up,_Artwork.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/BPNTC7uZYrI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Up&Up")
       
        let p4 = PartyRock(imageURL: "https://artistxite.ca/imgcache/album/004/972/004972672_500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vGZMvV9KBp8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "A Head Full Of Dreams")
        
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/c/c4/The_scientist_cover_art.JPG", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/RB-RcX5DS5A\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Scientist")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}






