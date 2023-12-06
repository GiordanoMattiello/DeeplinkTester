//
//  UIApplication+Protocol.swift
//  DeepLinkTesterIOS
//
//  Created by Giordano Mattiello on 06/12/23.
//

import SwiftUI

protocol IOSOSOpenLinkProtocol {
    #if os(iOS)
        func open(_ url: URL,
                  options: [UIApplication.OpenExternalURLOptionsKey : Any],
                  completionHandler: ((Bool) -> Void)?)
    #endif
    func open(_ url: URL)
    func open(_ url: URL, completionHandler: ((Bool) -> Void)?)
}

#if os(iOS)
    extension IOSOSOpenLinkProtocol {
            func open(_ url: URL,
                      completionHandler: ((Bool) -> Void)?) {
                open(url, options: [:], completionHandler: completionHandler)
            }
            func open(_ url: URL) {
                open(url, options: [:], completionHandler: nil)
            }
    }

    extension UIApplication: IOSOSOpenLinkProtocol { }
#endif
