import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            // Task 2: Add the logo view to LocationView
            LittleLemonLogo() // 1
                .padding(.top, 50)
            
            // Step 1: Create a Text element containing one of two strings
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location") // 2
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            
            // Step 2: Create a List inside a [NavigationView]
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    // Step 3: Add a NavigationLink to the List
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                } // 3
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

