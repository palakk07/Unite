////
////  AcademicDetailView.swift
////  Unite
////
////  Created by Pranav Bhandari on 3/23/23.
////
//
//import SwiftUI
//
//struct PeopleDetailView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @State private var searchText = ""
//    @State private var showInterestView = false
//    let viewModel = PeopleDetailViewModel()
//    
//    var btnBack : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//    }) {
//        HStack {
//            Image("back") // set image here
//                .renderingMode(.template)
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//        }
//    }
//    }
//    
//    var body: some View {
//        NavigationLink(destination: PeopleInterestView(model: viewModel.getSelectedModel()), isActive: $showInterestView) {
//            EmptyView()
//        }
//        VStack {
//            // Search bar
//            HStack {
//                Spacer().frame(width: 16)
//                
//                HStack {
//                    Image("search")
//                    
//                    TextField("Search", text: $searchText, onEditingChanged: { isEditing in
//                        //
//                    }, onCommit: {
//                        print("onCommit")
//                    })
//                    .foregroundColor(.white)
//                    
//                    Button(action: {
//                        self.searchText = ""
//                    }) {
//                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
//                    }
//                }
//                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//                .frame(height: 50)
//                .background(AppColors.secondaryBackground)
//                .foregroundColor(.white)
//                .background(Color(.white))
//                .cornerRadius(10.0)
//                .shadow(radius: 4)
//                
//                Spacer().frame(width: 16)
//                
//                HStack {
//                    Spacer().frame(width: 16)
//                    Image("filter")
//                        .renderingMode(.template)
//                        .foregroundColor(.white)
//                    Spacer().frame(width: 16)
//                }
//                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//                .frame(height: 50)
//                .background(AppColors.interestsSecondaryColor)
//                .cornerRadius(10.0)
//                .shadow(radius: 4)
//                
//                Spacer().frame(width: 16)
//            }
//            
//            Spacer().frame(height: 8)
//            
//            HStack {
//                Spacer().frame(width: 16)
//                
//                Text("Results for people in B.A. Anthropology :")
//                    .foregroundColor(.white)
//                    .font(.custom("Poppins-Medium", size: 13))
//                
//                Spacer()
//            }
//            
//            // List
//            
//            ScrollView {
//                VStack {
//                    ForEach(viewModel.getFilteredKeys(for: searchText), id: \.self) { key in
//                        HStack {
//                            Spacer().frame(width: 16)
//                            
//                            Text(key)
//                                .foregroundColor(.white)
//                                .font(.system(size: 32, weight: .bold))
//                            
//                            Spacer()
//                        }
//                        
//                        ForEach(viewModel.getFilteredPeople(for: searchText, section: key), id: \.self) {value in
//                            HStack {
//                                Spacer().frame(width: 16)
//                                
//                                PeopleDetailCell(model: value)
//                                    .frame(height: 136)
//                                    .cornerRadius(16)
//                                    .shadow(radius: 4)
//                                    .onTapGesture {
//                                        showInterestView.toggle()
//                                        viewModel.setSelectedModel(model: value)
//                                    }
//                                
//                                Spacer().frame(width: 16)
//                            }
//                        }
//                    }
//                    
//                    Spacer().frame(height: 50)
//                }
//            }
//            
//            Spacer()
//            
//                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: btnBack)
//                .navigationBarTitle("People", displayMode: .inline)
//                .navigationBarColor(backgroundColor: .clear, titleColor: .white)
//        }
//        .ignoresSafeArea(edges: .bottom)
//        .background(AppColors.blackColor)
//    }
//}
//
//struct AcademicDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleDetailView()
//    }
//}
