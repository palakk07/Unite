//
//  ContentView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/21/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabBar()
            .navigationBarBackButtonHidden(true)
    }
}

//struct ContentView: View {
//
//    init() {
//        //        UITabBar.appearance().isTranslucent = false
//        //        UITabBar.appearance().barTintColor = UIColor.red
//        //        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
//        UITabBar.appearance().backgroundColor = UIColor(AppColors.interestsSecondaryColor)
//        UITabBar.appearance().isTranslucent = false
//    }
//
//    @State private var selection = 0
//    @State private var title = ""
//
//    var body: some View {
//            TabView(selection: $selection) {
//                BotView()
//                    .onAppear {
//                        self.title = "Discover"
//                    }
//                    .tabItem {
//                        Label {
//                            Text("Discover")
//                                .font(.system(size: 11, weight: .semibold))
//                        } icon: {
//                            selection == 0 ? Image("discover_fill") : Image("discover")
//                        }
//
//                    }
//                    .tag(0)
//
//                PostsView()
//                    .onAppear {
//                        self.title = "Posts"
//                    }
//                    .tabItem {
//                        Label {
//                            Text("Posts")
//                                .font(.system(size: 11, weight: .semibold))
//                        } icon: {
//                            selection == 1 ? Image("posts_fill") : Image("posts")
//                        }
//                    }
//                    .tag(1)
//
//                PeopleDepartmentView()
//                    .onAppear {
//                        self.title = "People"
//                    }
//                    .tabItem {
//                        Label {
//                            Text("People")
//                                .font(.system(size: 11, weight: .semibold))
//                        } icon: {
//                            selection == 2 ? Image("people_fill") : Image("people")
//                        }
//                    }
//                    .tag(2)
//
//                ChatView()
//                    .onAppear {
//                        self.title = "Message"
//                    }
//                    .tabItem {
//                        Label {
//                            Text("Message")
//                                .font(.system(size: 11, weight: .semibold))
//                        } icon: {
//                            selection == 3 ? Image("message_fill") : Image("message")
//                        }
//                    }
//                    .tag(3)
//
//                ProfileView()
//                    .onAppear {
//                        self.title = "Account"
//                    }
//                    .tabItem {
//                        Label {
//                            Text("Account")
//                                .font(.system(size: 11, weight: .semibold))
//                        } icon: {
//                            selection == 4 ? Image("account_fill") : Image("account")
//                        }
//                    }
//                    .tag(4)
//            }
////            .navigationTitle(Text(title))
////            .navigationBarColor(backgroundColor: .clear, titleColor: .white)
//            .accentColor(.white)
//
//            .navigationBarBackButtonHidden(true)
////            .navigationBarTitle(Text(title), displayMode: .inline)
//
//        .background(Color.white)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
