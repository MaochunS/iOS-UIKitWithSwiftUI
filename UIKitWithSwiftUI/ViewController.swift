//
//  ViewController.swift
//  UIKitWithSwiftUI
//
//  Created by Maochun on 2023/9/24.
//

import UIKit
import SwiftUI

class ViewControllerCoordinator: NSObject, UINavigationControllerDelegate {
    var parent: ViewController
    
    init(_ parent: ViewController) {
        self.parent = parent
    }
    
    @objc func buttonTapped() {
        parent.nextAction()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let coordinator = ViewControllerCoordinator(self)

        let v = TestView(coordinator: coordinator)
        let hostingController = UIHostingController(rootView: v)
        
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

    struct TestView: View{
  
        var coordinator: ViewControllerCoordinator

        init(coordinator: ViewControllerCoordinator) {
            self.coordinator = coordinator
        }
        var body: some View{
            VStack{
                Text("This is the item list")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                List(0..<30){ item in
                    
                    VStack{
                        Text("Test \(item)")
                            .frame(width: UIScreen.main.bounds.width-32, height: 30, alignment: .leading)
                            .background(Color.gray)
                        Text("aaaa").frame(maxWidth: .infinity, alignment: .leading)
                        Text("12313423423").frame(maxWidth: .infinity, alignment: .leading)
                    }
 
                }.listStyle(.plain)
                Button("Next"){
                    coordinator.buttonTapped()
                }.buttonStyle(NextButtonStyle())
            }
        }
        
        
    }

    
    struct NextButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 20, weight: .medium))
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width-32, height: 60)
                .background(configuration.isPressed ? Color.gray : Color.blue) // Change background color on press
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding()
        }
    }
    
    func nextAction(){
        let vc = NextViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

