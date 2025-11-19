import SwiftUI
import SwiftData

@Model
final class Stamp {
    @Attribute(.unique) var id: UUID
    var price: Double
    
    init(id: UUID = UUID(), price: Double) {
        self.id = id
        self.price = price
    }
}

class StampStore: ObservableObject {
    @Published var stamps: [Stamp] = []
    
    var totalCount: Int {
        stamps.count
    }
    
    var totalPrice: Double {
        stamps.reduce(0) { $0 + $1.price }
    }
    
    init() {
        generateStamps()
    }
    
    func generateStamps() {
        var tempStamps: [Stamp] = []
        for _ in 0..<100_000 {
            let randomPrice = Double.random(in: 1...5)
            tempStamps.append(Stamp(price: randomPrice))
        }
        stamps = tempStamps
    }
}

struct StampListView: View {
    @StateObject private var store = StampStore()
    
    var body: some View {
        VStack {
            // Header hiển thị tổng số và tổng giá
            HStack {
                Text("Tổng số: \(store.totalCount)")
                Spacer()
                Text(String(format: "Tổng giá: $%.2f", store.totalPrice))
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            
            ScrollView {
                LazyVStack {
                    ForEach(store.stamps) { stamp in
                        HStack {
                            Text(stamp.id.uuidString.prefix(8) + "…")
                            Spacer()
                            Text(String(format: "$%.2f", stamp.price))
                        }
                        .padding(.horizontal)
                    }
                }
            }

        }
    }
}
