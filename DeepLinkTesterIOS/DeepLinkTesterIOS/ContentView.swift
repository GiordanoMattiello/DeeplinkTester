//
//  ContentView.swift
//  DeepLinkTester
//
//  Created by Giordano Bruno Olivetti Mattiello on 04/10/23.
//

import SwiftUI

struct DeepLinkLists: View {
    @State var links:[URL] = UserDefaltManager.shared.getLinks().compactMap({URL(string: $0)})
    @State private var tipedLink: String = ""
    @State private var isError = false
    @State private var otherError = false
    
    var body: some View {
        VStack {
            List {
                ForEach(links, id: \.self) { link in
                    HStack{
                        Button(link.absoluteString) {
                            UIApplication.shared.open(link, completionHandler: {
                                isError = !$0
                            })
                        }
                        .padding()
                    }
                }
                .onDelete { indexSet in
                    removeLink(index: indexSet)
                }
            }
            HStack {
                TextField("Deep Link to Tests",text: $tipedLink)
                    .disableAutocorrection(false)
                Button("Add") {
                    if let url = URL(string: tipedLink) {
                        addLink(url: url)
                        tipedLink = ""
                    } else {
                        isError = true
                    }
                }
            }
        }
        .alert(isPresented: $isError) {
            Alert(title: Text("URL invalida"),
                  message: Text(""),
                  dismissButton: .default(Text("OK")))
            
        }
        .padding()
    }
    
    func addLink(url: URL) {
        links.append(url)
        UserDefaltManager.shared.setLinks(links: links.map({$0.absoluteString}))
    }
    func removeLink(index: IndexSet) {
        links.remove(atOffsets: index)
        UserDefaltManager.shared.setLinks(links: links.map({$0.absoluteString}))
    }
}

struct DeepLinkLists_Previews: PreviewProvider {
    static var previews: some View {
        DeepLinkLists()
    }
}
