//
//  Router.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 9.9.22..
//

import UIKit

struct Constants {
    static let apiForUpcoming = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    static let live = "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500"
    static let apiForResults = "https://api.opap.gr/draws/v3.0/1100/draw-date/2022-09-13/2022-09-13"
//    static let apiForResults = "https://api.opap.gr/draws/v3.0/1100/draw-date/\(Date().parsedDate())/\(Date().parsedDate())"
}
