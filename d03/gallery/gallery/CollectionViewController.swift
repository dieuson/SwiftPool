//
//  CollectionViewController.swift
//  gallery
//
//  Created by Dieuson VIRGILE on 1/12/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct PictureDownloadedData {
    static var nbLoadedPictures = 0
    static var loadingError = false
    static var errorDisplayed = false
    static var errors :[(String, String)] = []
}

class CollectionViewController: UICollectionViewController {
    let urls = ["https://apod.nasa.gov/apod/image/1801/RCW114_FBcambell.jpg",
        "https://apod.nasa.gov/apod/image/1801/c2016_r2_2018_01_07dpjjc.jpg",
        "https://apod.nasa.gov/apod/image/1801/Arp243_Hubble_3978.jpg",
        "https://apod.nasa.gov/apod/image/1801/NGC7027_HubbleSchmidt_960.jpg"]

    @IBOutlet var collectionViewGalery: UICollectionView!{
        didSet {
            collectionViewGalery.dataSource = self
            collectionViewGalery.delegate = self
        }
    }
    
    func displayAlert(){
        if let lastError = PictureDownloadedData.errors.last {
            let alertController = UIAlertController(title: "Error ", message:
                "\((lastError.0)): " + (lastError.1), preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: { action in
                PictureDownloadedData.errors.removeLast()
                self.displayAlert()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DispatchQueue.global(qos: .background).async {
            while (PictureDownloadedData.nbLoadedPictures < self.urls.count){}
            DispatchQueue.main.async {
                if (PictureDownloadedData.loadingError) {
                    self.displayAlert()
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetailedScrollView")
        {
//            print(((sender as! CollectionViewCell).imageUI)!)
            if let cell = sender as! CollectionViewCell?
            {
                let destination = (segue.destination as! DetailedScrollViewController)
                destination.image = cell.imageUI
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.imageUrlSource = urls[indexPath.row]
        return cell
    }
}
