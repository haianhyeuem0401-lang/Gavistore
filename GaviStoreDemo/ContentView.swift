import SwiftUI
import WebKit

private enum GaviPalette {
    static let background = Color(red: 0.965, green: 0.965, blue: 0.95)
    static let ink = Color(red: 0.12, green: 0.14, blue: 0.16)
    static let muted = Color(red: 0.48, green: 0.50, blue: 0.52)
    static let accent = Color(red: 0.22, green: 0.39, blue: 0.34)
    static let line = Color(red: 0.88, green: 0.89, blue: 0.86)
}

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var selectedFolder = "Thư mục 1"
    @State private var folderMenu = false
    @State private var selectedPatch: String? = nil
    @State private var showDemoAlert = false
    @State private var showWebsite = false
    @State private var websiteTitle = "GaviStore Website"
    @Environment(\.openURL) private var openURL

    // Demo placeholders. Sẽ thay bằng dữ liệu thật khi website cung cấp API/manifest truy cập được từ app.
    private let folders = ["Thư mục 1 (Demo)", "Thư mục 2 (Demo)", "Thư mục 3 (Demo)"]
    private let patches = ["Patch 1 (Demo)", "Patch 2 (Demo)", "Patch 3 (Demo)", "Patch 4 (Demo)"]

    var body: some View {
        ZStack {
            GaviPalette.background.ignoresSafeArea()
            VStack(spacing: 0) {
                if selectedTab == 0 { homePage } else { functionsPage }
                bottomBar
            }
        }
        .preferredColorScheme(.light)
        .sheet(isPresented: $showWebsite) {
            NavigationStack {
                GaviWebsiteView()
                    .navigationTitle(websiteTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Đóng") { showWebsite = false } } }
            }
        }
        .alert("GaviStore", isPresented: $showDemoAlert) {
            Button("Đóng", role: .cancel) { }
        } message: {
            Text("Các mục Patch hiện là dữ liệu xem trước. Chức năng tải và áp dụng patch sẽ được nối sau khi có API tương ứng từ website.")
        }
    }

    private var topBar: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("GaviStore")
                    .font(.system(size: 27, weight: .bold, design: .rounded))
                    .foregroundStyle(GaviPalette.ink)
                Text("YOUR PERSONAL APP STORE")
                    .font(.system(size: 9, weight: .semibold, design: .rounded))
                    .tracking(2.1)
                    .foregroundStyle(GaviPalette.muted)
            }
            Spacer()
            Button { showDemoAlert = true } label: {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(GaviPalette.ink)
                    .frame(width: 43, height: 43)
                    .background(.white, in: RoundedRectangle(cornerRadius: 14))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(GaviPalette.line, lineWidth: 1))
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 15)
        .padding(.bottom, 18)
    }

    private var homePage: some View {
        VStack(spacing: 0) {
            topBar
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    ZStack(alignment: .bottomLeading) {
                        Image("KingBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 168)
                            .clipped()
                        LinearGradient(colors: [.clear, .black.opacity(0.72)], startPoint: .center, endPoint: .bottom)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("GBao?? 🦖")
                                .font(.system(size: 25, weight: .black, design: .rounded))
                            Text("QBaoTweakxVft King")
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                            Text("GAVISTORE")
                                .font(.system(size: 9, weight: .heavy)).tracking(3)
                        }
                        .foregroundStyle(.white)
                        .padding(16)
                    }
                    .frame(height: 168)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    HStack {
                        Text("ỨNG DỤNG CỦA BẠN")
                            .font(.system(size: 10, weight: .bold))
                            .tracking(1.7)
                            .foregroundStyle(GaviPalette.muted)
                        Spacer()
                        Text("01 APP")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundStyle(GaviPalette.accent)
                    }
                    Button { showDemoAlert = true } label: {
                        VStack(alignment: .leading, spacing: 13) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(GaviPalette.accent.opacity(0.10))
                                    .frame(width: 64, height: 64)
                                Image(systemName: "app.fill")
                                    .font(.system(size: 29, weight: .medium))
                                    .foregroundStyle(GaviPalette.accent)
                            }
                            Text("App1")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .foregroundStyle(GaviPalette.ink)
                            Text("Chạm để xem ứng dụng")
                                .font(.system(size: 12))
                                .foregroundStyle(GaviPalette.muted)
                        }
                        .frame(maxWidth: .infinity, minHeight: 158, alignment: .leading)
                        .padding(18)
                        .background(.white, in: RoundedRectangle(cornerRadius: 23))
                        .overlay(RoundedRectangle(cornerRadius: 23).stroke(GaviPalette.line, lineWidth: 1))
                    }
                    .buttonStyle(.plain)

                    HStack(spacing: 10) {
                        communityCard(title: "Nhóm Telegram", subtitle: "Tham gia cộng đồng", icon: "paperplane.fill", url: "https://t.me/sqbcheat")
                        communityCard(title: "Nhóm Zalo", subtitle: "Kết nối cùng nhau", icon: "message.fill", url: "https://zalo.me/g/m7chhkvpckgqpdls7fxc")
                    }

                    VStack(alignment: .leading, spacing: 13) {
                        HStack {
                            Text("Admin: @QBaoTweakxVft_King")
                                .font(.system(size: 11, weight: .semibold, design: .rounded))
                                .foregroundStyle(GaviPalette.muted)
                            Spacer()
                            Button { if let link = URL(string: "https://t.me/QBaoTweakxVft_King") { openURL(link) } } label: { Text("Liên hệ Admin").font(.system(size: 10, weight: .bold)).foregroundStyle(.purple) }
                        }
                        HStack {
                            Text("Chúc các bạn có trải nghiệm vui vẻ")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(GaviPalette.ink)
                            Spacer()
                            Image(systemName: "heart.fill").foregroundStyle(GaviPalette.accent)
                        }
                        Rectangle().fill(GaviPalette.line).frame(height: 1)
                        HStack {
                            Text("Key: Gbao")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundStyle(GaviPalette.muted)
                            Text("••••••••")
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundStyle(GaviPalette.muted)
                            Spacer()
                            Button { websiteTitle = "Check Key"; showWebsite = true } label: {
                                Text("CHECK KEY")
                                    .font(.system(size: 9, weight: .bold))
                                    .tracking(1)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 11).padding(.vertical, 7)
                                    .background(Color.purple, in: Capsule())
                            }
                        }
                    }
                    .padding(17)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(GaviPalette.line, lineWidth: 1))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
    }

    private func communityCard(title: String, subtitle: String, icon: String, url: String) -> some View {
        Button { if let link = URL(string: url) { openURL(link) } } label: {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(GaviPalette.accent)
                Text(title).font(.system(size: 13, weight: .bold)).foregroundStyle(GaviPalette.ink)
                Text(subtitle).font(.system(size: 10)).foregroundStyle(GaviPalette.muted)
            }
            .frame(maxWidth: .infinity, minHeight: 104, alignment: .leading)
            .padding(14)
            .background(.white, in: RoundedRectangle(cornerRadius: 19))
            .overlay(RoundedRectangle(cornerRadius: 19).stroke(GaviPalette.line, lineWidth: 1))
        }
        .buttonStyle(.plain)
    }

    private var functionsPage: some View {
        VStack(spacing: 0) {
            topBar
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 17) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CHỨC NĂNG")
                            .font(.system(size: 10, weight: .bold)).tracking(1.8)
                            .foregroundStyle(GaviPalette.muted)
                        Text("Thư viện Patch")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                            .foregroundStyle(GaviPalette.ink)
                    }
                    Button { withAnimation(.easeInOut(duration: 0.18)) { folderMenu.toggle() } } label: {
                        HStack(spacing: 11) {
                            Image(systemName: "folder.fill").foregroundStyle(GaviPalette.accent)
                            Text(selectedFolder).font(.system(size: 14, weight: .semibold)).foregroundStyle(GaviPalette.ink)
                            Spacer()
                            Image(systemName: folderMenu ? "chevron.up" : "chevron.down")
                                .font(.system(size: 12, weight: .bold)).foregroundStyle(GaviPalette.muted)
                        }
                        .padding(16)
                        .background(.white, in: RoundedRectangle(cornerRadius: 16))
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(GaviPalette.line, lineWidth: 1))
                    }
                    .buttonStyle(.plain)
                    if folderMenu {
                        VStack(spacing: 0) {
                            ForEach(folders, id: \.self) { folder in
                                Button {
                                    selectedFolder = folder
                                    folderMenu = false
                                    selectedPatch = nil
                                } label: {
                                    HStack {
                                        Image(systemName: "folder").foregroundStyle(GaviPalette.accent)
                                        Text(folder).foregroundStyle(GaviPalette.ink)
                                        Spacer()
                                        if selectedFolder == folder { Image(systemName: "checkmark").foregroundStyle(GaviPalette.accent) }
                                    }
                                    .font(.system(size: 13, weight: .medium))
                                    .padding(14)
                                }
                                .buttonStyle(.plain)
                                if folder != folders.last { Divider().overlay(GaviPalette.line) }
                            }
                        }
                        .background(.white, in: RoundedRectangle(cornerRadius: 15))
                    }
                    Button { websiteTitle = "Kho Patch trên Website"; showWebsite = true } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "globe")
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Mở kho Patch trên Website").font(.system(size: 13, weight: .bold))
                                Text("Truy cập dashboard GaviStore").font(.system(size: 10))
                            }
                            Spacer()
                            Image(systemName: "arrow.up.right")
                        }
                        .foregroundStyle(.white)
                        .padding(15)
                        .background(LinearGradient(colors: [Color.purple, Color(red: 0.25, green: 0.05, blue: 0.45)], startPoint: .topLeading, endPoint: .bottomTrailing), in: RoundedRectangle(cornerRadius: 16))
                    }
                    .buttonStyle(.plain)
                    HStack {
                        Text("PATCH CÓ SẴN")
                            .font(.system(size: 10, weight: .bold)).tracking(1.5)
                            .foregroundStyle(GaviPalette.muted)
                        Spacer()
                        Text("\(patches.count) ITEMS")
                            .font(.system(size: 9, weight: .bold)).foregroundStyle(GaviPalette.accent)
                    }
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                        ForEach(patches, id: \.self) { patch in
                            Button {
                                selectedPatch = patch
                                showDemoAlert = true
                            } label: {
                                VStack(alignment: .leading, spacing: 15) {
                                    HStack {
                                        Image(systemName: "shippingbox.fill")
                                            .font(.system(size: 19)).foregroundStyle(GaviPalette.accent)
                                        Spacer()
                                        Image(systemName: "arrow.up.right")
                                            .font(.system(size: 11, weight: .bold)).foregroundStyle(GaviPalette.muted)
                                    }
                                    Text(patch)
                                        .font(.system(size: 15, weight: .bold, design: .rounded))
                                        .foregroundStyle(GaviPalette.ink)
                                    Text("\(selectedFolder) · Demo")
                                        .font(.system(size: 10, weight: .medium))
                                        .foregroundStyle(GaviPalette.muted)
                                }
                                .frame(maxWidth: .infinity, minHeight: 112, alignment: .leading)
                                .padding(15)
                                .background(.white, in: RoundedRectangle(cornerRadius: 19))
                                .overlay(RoundedRectangle(cornerRadius: 19).stroke(selectedPatch == patch ? GaviPalette.accent : GaviPalette.line, lineWidth: selectedPatch == patch ? 1.5 : 1))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    Text("Bản xem trước giao diện · Dữ liệu minh họa")
                        .font(.system(size: 10)).foregroundStyle(GaviPalette.muted)
                        .frame(maxWidth: .infinity).padding(.top, 5)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
            }
        }
    }

    private var bottomBar: some View {
        HStack(spacing: 0) {
            tabButton(title: "Home", icon: "house.fill", index: 0)
            tabButton(title: "Chức năng", icon: "slider.horizontal.3", index: 1)
        }
        .padding(.top, 11)
        .padding(.bottom, 7)
        .background(.white)
        .overlay(alignment: .top) { Rectangle().fill(GaviPalette.line).frame(height: 1) }
    }

    private func tabButton(title: String, icon: String, index: Int) -> some View {
        Button { withAnimation(.easeInOut(duration: 0.18)) { selectedTab = index } } label: {
            VStack(spacing: 5) {
                Image(systemName: icon).font(.system(size: 18, weight: .semibold))
                Text(title).font(.system(size: 10, weight: .semibold))
            }
            .foregroundStyle(selectedTab == index ? GaviPalette.accent : GaviPalette.muted)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}


private struct GaviWebsiteView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.scrollView.contentInsetAdjustmentBehavior = .never
        view.load(URLRequest(url: URL(string: "https://gbao.infinityfreeapp.com/dashboard.php")!))
        return view
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
