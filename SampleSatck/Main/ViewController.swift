//
//  ViewController.swift
//  SampleSatck
//
//  Created by Timothy Obeisun on 7/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchContainerView: UIView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var subHeaderCollectionView: UICollectionView!
    
    @IBOutlet weak var dataCollectionView: UICollectionView!
    
    @IBOutlet weak var dataCollectionViewContainerHeightConstarint: NSLayoutConstraint!
    
    var subHeaderArray: [SubHeader] = []
    var dataArray: [DataPayload] = []
    
    var dataCellHeight = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        setupSubHeaderArray()
        setupDataCollectionView()
    }
}

extension ViewController {
    func setupView() {
        searchContainerView.layer.cornerRadius = 20
    }
    
    func setupSubHeaderArray() {
        subHeaderArray = [.init(title: "Pending"), .init(title: "Picked up"), .init(title: "Completed"), .init(title: "Cancelled"), .init(title: "Unpaid")]
    }
    
    func setupDataCollectionView() {
        dataCollectionView.delegate = self
        dataCollectionView.dataSource = self
        
        dataArray = [
            .init(date: "18-02-2024", orderID: "50120", amount: "₦9000", distance: "6.8km"),
            .init(date: "19-02-2024", orderID: "50121", amount: "₦7000", distance: "7.8km"),
            .init(date: "20-02-2024", orderID: "50122", amount: "₦9000", distance: "8.8km"),
            .init(date: "22-02-2024", orderID: "50123", amount: "₦9000", distance: "9.8km"),
            .init(date: "21-02-2024", orderID: "50124", amount: "₦9000", distance: "3.8km")
        ]
        
        dataCollectionViewContainerHeightConstarint.constant = CGFloat(dataArray.count * dataCellHeight)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subHeaderCollectionView {
            return subHeaderArray.count
        } else {
            return dataArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == subHeaderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubHeaderCollectionViewCell", for: indexPath) as! SubHeaderCollectionViewCell
            cell.setup(item: subHeaderArray[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
            cell.setup(item: dataArray[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dataCollectionView {
            return CGSize(width: (Int(view.frame.size.width) - 32), height: dataCellHeight)
        }
        return CGSize(width: view.frame.size.width / 4, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == subHeaderCollectionView {
            let row = indexPath.row
            switch row {
            case 0:
                debugPrint("Pending")
            case 1:
                debugPrint("Picked up")
            case 2:
                debugPrint("Completed")
            case 3:
                debugPrint("Cancelled")
            case 4:
                debugPrint("Unpaid")
            default:
                return
            }
        }
    }
}
