//
//  LinkOpener.swift
//  DeepLinkTesterIOS
//
//  Created by Giordano Mattiello on 06/12/23.
//

import SwiftUI

enum LinkOpenerError: Error{
    case invalidURL
    case failedToOpenURL
    case unsupportedPlatform
}

protocol LinkOpenerProtocol {
    func open(link: URL, completionHandler: @escaping (Bool) -> Void) throws
}

class CoreLinkOpenerFactory {
    static func getLinkOpener() -> LinkOpenerProtocol {
        #if os(iOS)
        return IOSLinkOpener(iosOSOpenLink: UIApplication.shared)
        #elseif os(macOS)
        return MacLinkOpener(macOSOpenLink: NSWorkspace.shared)
        #endif
    }
}
