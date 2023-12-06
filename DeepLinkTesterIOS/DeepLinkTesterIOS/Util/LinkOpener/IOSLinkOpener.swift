//
//  IOSLinkOpener.swift
//  DeepLinkTesterIOS
//
//  Created by Giordano Mattiello on 06/12/23.
//

import SwiftUI

struct IOSLinkOpener: LinkOpenerProtocol {
    var iosOSOpenLink: IOSOSOpenLinkProtocol?
    
    init(iosOSOpenLink: IOSOSOpenLinkProtocol?) {
        self.iosOSOpenLink = iosOSOpenLink
    }
    
    func open(link: URL, completionHandler: @escaping (Bool) -> Void) throws {
        guard let iosOSOpenLink = self.iosOSOpenLink else {
            throw LinkOpenerError.unsupportedPlatform
        }
        iosOSOpenLink.open(link, completionHandler: completionHandler)
    }
}
