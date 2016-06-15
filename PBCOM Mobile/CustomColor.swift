//
//  CustomColor.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/13/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class CustomColor: NSObject {

    
    func redFade() -> UIColor {
        return UIColor(red: 240/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
    }
    
    func orangeFade() -> UIColor {
        return UIColor(red: 244/255.0, green: 128/255.0, blue: 80/255.0, alpha: 1.0)
    }

    func grayFade() -> UIColor {
        return UIColor(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1.0)
    }

    func borderColortextField() -> UIColor {
        return UIColor(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1)
    }
 
    func headerTableCellColor() -> UIColor {
        return UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1.0)
    }
}
