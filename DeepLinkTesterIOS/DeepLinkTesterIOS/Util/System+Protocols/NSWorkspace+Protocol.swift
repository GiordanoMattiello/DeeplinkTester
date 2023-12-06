//
//  NSWorkspace+Protocol.swift
//  DeepLinkTesterIOS
//
//  Created by Giordano Mattiello on 06/12/23.
//

import SwiftUI

#if os(macOS)
    extension NSWorkspace: MacOSOpenLinkProtocol {}
#endif
protocol MacOSOpenLinkProtocol {
    func open(_ url: URL) -> Bool
}
