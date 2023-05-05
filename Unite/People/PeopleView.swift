////
////  PeopleView.swift
////  Unite
////
////  Created by Pranav Bhandari on 3/21/23.
////
//
//import SwiftUI
//
//struct PeopleView: View {
//    private static let cellHeight: CGFloat = 50
//    @State private var searchText = ""
//    @State var segmentationSelection : PeopleFilterCategory = .byAcademic
//    @State private var categoryIsActive = false
//    @State private var showBackButton = false
//    @State private var hobbiesIsActive = false
//    @State private var majorsIsActive = false
//    @State private var selectedDepartment: Departments = .lettersArtsAndSocialSciences
//    private let viewModel = PeopleViewModel()
//
//
//    var btnBack : some View { Button(action: {
//        categoryIsActive.toggle()
//    }) {
//        HStack {
//            Image("back") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.black)
//        }
//    }
//    }
//
//    var body: some View {
//        VStack {
//            NavigationLink(destination: PeopleDetailView(), isActive: $majorsIsActive) {
//                EmptyView()
//            }
//
//            HStack {
//                Spacer().frame(width: 16)
//                Text("Connect with people based on your academics, Interests :")
//                    .foregroundColor(.white)
//                    .font(.custom("Poppins-Medium", size: 13))
//                Spacer().frame(width: 16)
//            }
//
//            HStack {
//                Spacer().frame(width: 16)
//                HStack {
//                    Image("search")
//
//                    TextField("Search for Department", text: $searchText, onEditingChanged: { isEditing in
//                        //
//                    }, onCommit: {
//                        print("onCommit")
//                    }).foregroundColor(.primary)
//
//                    Button(action: {
//                        self.searchText = ""
//                    }) {
//                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
//                    }
//                }
//                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
//                .frame(height: 50)
//                .foregroundColor(.secondary)
//                .background(Color(.white))
//                .cornerRadius(10.0)
//                .shadow(radius: 4)
//
//                Spacer().frame(width: 16)
//            }
//
//            // Picker View
//            Picker("", selection: $segmentationSelection) {
//                ForEach(PeopleFilterCategory.allCases, id: \.self) { option in
//                    Text(option.rawValue)
//                        .font(.system(size: 15))
//                }
//            }
//            .background(AppColors.interestsSecondaryColor)
//            .pickerStyle(SegmentedPickerStyle())
//            .padding()
//
//            ScrollView {
//                VStack {
//                    if (segmentationSelection == .byAcademic) {
//                        if categoryIsActive {
//                            ForEach(viewModel.getAcademicMajorsItems(for: searchText, department: selectedDepartment), id:\.self) { value in
//                                HStack {
//                                    Spacer().frame(width: 8)
//
//                                    VStack(alignment: .leading) {
////                                        PeopleFilterCell(categoryName: value.rawValue)
////                                            .frame(height: Self.cellHeight)
////                                            .cornerRadius(16)
////                                            .shadow(radius: 4)
//
//                                        Text(value.rawValue)
//                                            .font(.custom("Poppins-Regular", size: 13))
//                                            .padding(.leading, 16)
//                                            .padding(.trailing, 16)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(height: 50)
//                                            .foregroundColor(.white)
//                                            .background(AppColors.interestsSecondaryColor)
//                                            .cornerRadius(6)
//                                    }
//
//                                    Spacer().frame(width: 8)
//                                }
//                                .contentShape(Rectangle())
//                                .onTapGesture {
//                                    majorsIsActive.toggle()
//                                    print(value.rawValue)
//                                }
//                            }
//                        } else {
//                            ForEach(viewModel.getCategoryItems(for: searchText), id:\.self) { value in
//                                HStack {
//                                    Spacer().frame(width: 8)
//
//                                    VStack(alignment: .leading) {
//                                        Text(value.rawValue)
//                                            .font(.custom("Poppins-Regular", size: 13))
//                                            .padding(.leading, 16)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(height: 50)
//                                            .foregroundColor(.white)
//                                            .background(AppColors.interestsSecondaryColor)
//                                            .cornerRadius(6)
//                                    }
//
//                                    Spacer().frame(width: 8)
//                                }
//                                .contentShape(Rectangle())
//                                .onTapGesture {
//                                    selectedDepartment = value
//                                    categoryIsActive = true
//                                    print("Here right \(value.rawValue)")
//                                }
//                            }
//                        }
//                    } else {
//                            ForEach(viewModel.getInterestItems(for: searchText), id:\.self) { value in
//                                HStack {
//                                    Spacer().frame(width: 8)
//
//                                    VStack(alignment: .leading) {
//                                        Text(value.rawValue)
//                                            .font(.custom("Poppins-Regular", size: 13))
//                                            .padding(.leading, 16)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(height: 50)
//                                            .foregroundColor(.white)
//                                            .background(AppColors.interestsSecondaryColor)
//                                            .cornerRadius(6)
//                                    }
//
//                                    Spacer().frame(width: 8)
//                                }
//                                .contentShape(Rectangle())
//                                .onTapGesture {
//                                    showBackButton = true
//                                    categoryIsActive = true
//                                    print(value.rawValue)
//                                }
//                            }
//                    }
//
//                    Spacer()
//                }
//            }
//        }
//        .background(AppColors.blackColor)
//        .frame(maxHeight: .infinity)
//    }
//}
//
//struct PeopleView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleView()
//    }
//}
