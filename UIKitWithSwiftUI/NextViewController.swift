//
//  NextViewController.swift
//  UIKitWithSwiftUI
//
//  Created by Maochun on 2023/9/24.
//

import UIKit
import SwiftUI

class NextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: TheView())
        
        // Add the UIHostingController as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set constraints to position and size the SwiftUI view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
        
    }
    
    struct TheView: View{
       
        var body: some View{
            VStack{
                Text("This is the second view controller")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .font(.system(size: 30,weight: .medium))
                    .foregroundColor(Color.green)
          
            }
        }
    }
}
