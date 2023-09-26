import SwiftUI

struct FlickrSearchImageView: View {
    typealias Strings = L10n.FlickrSearchImageView
    @ObservedObject private var viewModel: FlickrSearchImageViewModel

    @State var searchText: String = ""
    @State var isSearching: Bool = false

    init(
        viewModel: FlickrSearchImageViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack{
            header
            ScrollView {
                VStack {
                    if viewModel.searchedList.isEmpty {
                        ListEmptyView(title: Strings.EmptyView.title,
                                      description: Strings.EmptyView.description)
                    } else {
                        ForEach(viewModel.searchedList, id: \.id) { item in
                            ImageCardView(imageUrl: item.imageUrl)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.appBackgroundColor)
    }

    var header: some View {
        VStack {
            TextView(text: Strings.title,
                     font: .title,
                     color: .titleText)

            SearchBar(
                text: $searchText,
                cancelButtonAction: {
                    viewModel.searchCanceled()
                })
            .padding()
            .onChange(of: searchText) { oldValue, newValue in
                Task {
                    await viewModel.searchImages(newValue)
                }
            }
        }
    }
}

#Preview {
    FlickrSearchImageView(viewModel: FlickrSearchImageViewModel(repository: FlickrSearchImageRepository(), navigator: nil))
}
