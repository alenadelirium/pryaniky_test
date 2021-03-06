//
//  PictureTableViewCell.swift
//  TestPryaniky
//
//  Created by alena on 14.07.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pryanikyImageView: UIImageView!
    @IBOutlet weak var lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        pryanikyImageView.clipsToBounds = true
//        pryanikyImageView.contentMode = .scaleAspectFill
       
    }

    func configure(data: [GeneralData]) {

        for elem in data {
            if elem.name == "picture" {
                guard let dataileDataText = elem.data?.text,
                    let url = URL(string: elem.data?.url ?? "") else {
                        pryanikyImageView.image = nil
                        return
                }

                

                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)

                    DispatchQueue.main.async {
                        guard let data = data else { return }
                        let image = UIImage(data: data)
                        
                        self.pryanikyImageView.image = image!
                        self.lable.text = dataileDataText

                    }
                }
            }
        }
    }
}

