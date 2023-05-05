//
//  TabBar.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct TabBar: View {
    @State var current = "Discover"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $current) {
                BotView()
                    .tag("Discover")
                
                PostsView()
                    .tag("Feed")
                
                PeopleDepartmentView()
                    .tag("People")
                
                ChatView()
                    .tag("Messages")
            }
            
            HStack {
                Spacer().frame(width: 16)
                HStack(spacing: 0) {
                    //
                    
                    TabButton(title: "Discover", image: "tab_discover", selected: $current)
                    Spacer()
                    TabButton(title: "Feed", image: "tab_feed", selected: $current)
                    Spacer()
                    TabButton(title: "People", image: "tab_people", selected: $current)
                    Spacer()
                    TabButton(title: "Messages", image: "tab_messages", selected: $current)
                }
                .padding(.leading, 14)
                .padding(.top, 16)
                .padding(.bottom, 16)
                .padding(.trailing, 14)
                .background(AppColors.interestsPrimaryColor)
                .clipShape(
                    Rectangle()
                )
                .cornerRadius(18)
                Spacer().frame(width: 16)
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
