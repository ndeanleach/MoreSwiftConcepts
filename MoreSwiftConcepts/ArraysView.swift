//
//  ArraysView.swift
//  MoreSwiftConcepts
//
//  Created by Nathan Leach on 10/3/23.
//

import SwiftUI


struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        
        //map
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points})
            .filter({ $0.isVerified })
            .map( {$0.name} )
        
        //sort
        /*
        filteredArray = dataArray.sorted (by: { $0.points > $1.points } )
         */
        
        //filter
        /*
        filteredArray = dataArray.filter( {$0.isVerified} )
        */
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Henry", points: 5, isVerified: false)
        let user2 = UserModel(name: "Jack", points: 12, isVerified: true)
        let user3 = UserModel(name: "Sam", points: 23, isVerified: true)
        let user4 = UserModel(name: "Nate", points: 8, isVerified: false)
        let user5 = UserModel(name: "Dean", points: 10, isVerified: false)
        let user6 = UserModel(name: "Max", points: 14, isVerified: true)
        let user7 = UserModel(name: "Katie", points: 19, isVerified: false)
        let user8 = UserModel(name: "Reuben", points: 2, isVerified: true)
        let user9 = UserModel(name: "Jerry", points: 9, isVerified: true)
        let user10 = UserModel(name: "Remi", points: 11, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct ArraysView: View {
    
    @StateObject var viewModel = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                //Iterate filteredArray instead
                /*
//                ForEach(viewModel.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack{
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            } else {
//                                Image(systemName: "")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(.blue)
//                    .clipShape(.rect(cornerRadius: 10))
//                    .padding(.horizontal)
//                }
                 */
            }
        }
    }
}

#Preview {
    ArraysView()
}
