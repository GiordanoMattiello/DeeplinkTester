//
//  UserDefaltManager.swift
//  DeepLinkTester
//
//  Created by Giordano Bruno Olivetti Mattiello on 04/10/23.
//

import Foundation

class UserDefaltManager {
    static let shared = UserDefaltManager()
    
    func setLinks(links: [String]) {
        UserDefaults.standard.set(links, forKey: "SavedLinks")
    }
    
    func getLinks() -> [String]{
        return UserDefaults.standard.object(forKey: "SavedLinks") as? [String] ?? [
            "https://apps.apple.com"
        ]
    }
}
