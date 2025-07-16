import SwiftUI
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}
struct ContentView: View {
    let people: [Person] = [
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65),
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65),
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65),
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65),
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65),
        Person(name: "AAAAAAAAAAA", age: 23),
        Person(name: "BBBBBBBBBBB", age: 32),
        Person(name: "CCCCCCCCCCC", age: 65)
    ]
    var imageNames: [String] = ["i1","i2","i3","i4"]
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // Horizontal Image Slider
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(imageNames, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width - 16, height: 250)
                                        .clipped()
                                        .cornerRadius(12)
                                }
                            }
                            .padding(.horizontal, 8)
                            .padding(.top)
                        }

                        // List-like person rows
                        ForEach(people) { person in
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(person.name)
                                        .font(.system(size: 18))
                                    Text("\(person.age)")
                                        .font(.system(size: 12))
                                }
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            Divider()
                        }
                    }
                }
                
            }
        }
}
#Preview {
    ContentView()
}



