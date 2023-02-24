//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Soujanya G on 2/23/23.
//

import SwiftUI

// TO CONNECT XCODE PROJECT AND GITHUB REPO
// Go to Xcode project dir on terminal
// Create github repo on chrome
// COMMAND TO RUN IN TERMINAL: git remote add origin [https of git here](ex: https://github.com/sjgeddam/ViewsAndModifiers.git)

// Swift UI uses Structs for Views as opposed to Classes for performance reasons.
// Views become simple inert things that convert data into UI when we use Structs.

// What is behing the main SwiftUI view?
// For swift UI developers, there is nothing behind our view. (UI hosting controller - connects UIKit with SwiftUI)

// For swift UI developers, please don't reach outside of ContentView. Assume that this is all we have.

// Whenever we apply a modifier to a view, we actually create a copy of that view with the change applied. Your order of the modifier matters - first modifier applies first, second on top of it, and so on. SwiftUI renders your view after every single modifier - not actually how SwiftUI works - but a neat mental short cut while you are learning. As such, we can apply modifiers multiple times.

// Can use ternary conditional operator with conditional modifiers to set views based on true/false

// Need to read documentation on whether a modifier is a environment modifier or regular modifier.

// Can create views as properties - allows for cleaner code in the body property.

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    let motto1 = Text("YOYOYOY")
    @ViewBuilder var motto2: some View {
        // Should be careful when doing this because motto2 doesn't have ViewBuilder as 'body' inherently has - should specifically organize in stack. If you don't want to specifically organize in stack, you could sent back a group.
        // Final option is to apply @ViewBuilder before declaring motto2 (if you don't want to use Group or Stacks)
        Group {
            Text("HAHAAHAA")
            Text("WHATS GOOD")
        }
    }
    var body: some View {
        VStack {
            motto1
            motto2
                .foregroundColor(.mint)
            Text("Griffindor")
                .font(.largeTitle)
                .blur(radius: 20)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
                .bold()
        }
        .font(.title) // environment moditfier - applied to every element in vstack. but child's version will take priority
        .blur(radius: 0) // not an environment modifier, regular modifier - child modifier adds up
        
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "SECOND")
                .foregroundColor(.orange)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
