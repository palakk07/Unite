//
//  PeopleDepartmentView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/3/23.
//

import SwiftUI

struct PeopleDepartmentView: View {
    private static let cellHeight: CGFloat = 50
    @State private var searchText = ""
    @State var segmentationSelection : PeopleFilterCategory = .byAcademic
    @State private var categoryIsActive = false
    @State private var showBackButton = false
    @State private var hobbiesIsActive = false
    @State private var departmentIsActive = false
    @State private var selectedDepartment: Departments = .lettersArtsAndSocialSciences
    private let viewModel = PeopleViewModel()

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("People")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                Spacer()
            }
            
            NavigationLink(destination: PeopleMajorsView(selectedDepartment: selectedDepartment), isActive: $departmentIsActive) {
                EmptyView()
            }
            
            Spacer().frame(height: 37)
            
            HStack {
                Spacer().frame(width: 16)
                Text("Connect with people based on your academics, Interests :")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Medium", size: 13))
                Spacer().frame(width: 16)
            }
            
            HStack {
                Spacer().frame(width: 16)
                HStack {
                    Image("search")
                    
                    TextField("Search for Department", text: $searchText, onEditingChanged: { isEditing in
                        //
                    }, onCommit: {
                        print("onCommit")
                    })
                    .font(.custom("Poppins-Regular", size: 13))
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search for Department or select from list")
                            .font(.custom("Poppins-Regular", size: 13))
                    }
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .foregroundColor(.white)
                .background(AppColors.interestsSecondaryColor)
                .cornerRadius(10.0)
                .shadow(radius: 4)
                
                Spacer().frame(width: 16)
            }
            
            // Picker View
            Picker("", selection: $segmentationSelection) {
                ForEach(PeopleFilterCategory.allCases, id: \.self) { option in
                    Text(option.rawValue)
                        .font(.system(size: 15))
                }
            }
            .background(AppColors.interestsSecondaryColor)
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                VStack {
                    if (segmentationSelection == .byAcademic) {
                            ForEach(viewModel.getCategoryItems(for: searchText), id:\.self) { value in
                                HStack {
                                    Spacer().frame(width: 8)
                                    
                                    VStack(alignment: .leading) {
                                        PeopleFilterCell(categoryName: value.rawValue, categoryImgName: value.imgName)
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .padding(.leading, 16)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height: 80)
                                            .foregroundColor(.white)
                                            .background(AppColors.interestsSecondaryColor)
                                            .cornerRadius(12)
                                    }
                                    
                                    Spacer().frame(width: 8)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDepartment = value
                                    departmentIsActive.toggle()
                                    print("Here right \(value.rawValue)")
                                }
                            }
                    } else {
                            ForEach(viewModel.getMainInterestItems(for: searchText), id:\.self) { value in
                                HStack {
                                    Spacer().frame(width: 8)
                                    
                                    VStack(alignment: .leading) {
                                        PeopleFilterCell(categoryName: value.rawValue, categoryImgName: value.imgName)
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .padding(.leading, 16)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height: 80)
                                            .foregroundColor(.white)
                                            .background(AppColors.interestsSecondaryColor)
                                            .cornerRadius(12)
                                    }
                                    
                                    Spacer().frame(width: 8)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    showBackButton = true
                                    categoryIsActive = true
                                    print(value.rawValue)
                                }
                            }
                    }
                    
                    Spacer()
                }
            }
        }
        .background(AppColors.blackColor)
        .frame(maxHeight: .infinity)
    }
}

struct PeopleDepartmentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDepartmentView()
    }
}
