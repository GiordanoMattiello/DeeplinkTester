//
//  MacLinkOpener.swift
//  DeepLinkTesterIOS
//
//  Created by Giordano Mattiello on 06/12/23.
//

import SwiftUI

struct MacLinkOpener: LinkOpenerProtocol {
    var macOSOpenLink: MacOSOpenLinkProtocol?
    
    init(macOSOpenLink: MacOSOpenLinkProtocol?) {
        self.macOSOpenLink = macOSOpenLink
    }
    
    func open(link: URL, completionHandler: @escaping (Bool)-> Void ) throws {
        guard let macOSOpenLink = self.macOSOpenLink else {
            throw LinkOpenerError.unsupportedPlatform
        }
        if !macOSOpenLink.open(link) {
            throw LinkOpenerError.failedToOpenURL
        }
        completionHandler(true)
    }
}
