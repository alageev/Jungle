//
//  ImageView.swift
//  Jungle
//
//  Created by Алексей Агеев on 14.09.2020.
//

//import Combine
//import SwiftUI
//
//struct ImageView: View {
//    @ObservedObject var imageLoader: ImageLoader
//    @State var image: UIImage = UIImage()
//    
//    init(withURL url:String) {
//        imageLoader = ImageLoader(urlString: url)
//    }
//    
//    var body: some View {
//        VStack {
//            Image(uiImage: image)
//                .resizable()
////                .ignoresSafeArea()
////                .cornerRadius(10)
////        }.onReceive(imageLoader.dataPublisher) { data in
////            self.image = UIImage(data: data) ?? UIImage()
////        }
//        }
//    }
//}
//
//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(withURL: "https://s360sas.storage.yandex.net/rdisk/79e0410201415110855a3085eb9e4fd78dd7de3acf204922e404f03f6ddc0b54/5f5f9b9a/JsHyneM_hEmiY27_1VZPFv_M-tLDeUzpMlvQGbxvStiyC47iz3vvdFJnXTD3LP0QA7pciaj4FtuS4TepmC4eXA==?uid=226156814&filename=04prjQDN5g0.jpg&disposition=inline&hash=&limit=0&content_type=image%2Fjpeg&tknv=v2&owner_uid=226156814&media_type=image&hid=38a4e25a5ff0e7661e1acf36428fd6cf&etag=4bdeeb78abdf6a3036f4972083654474&fsize=181299&rtoken=LFhaoXgmVRVr&force_default=yes&ycrid=na-546734b8590aa445bb76dbb86b7c303e-downloader17h&ts=5af489c0a9a80&s=c39b6937ddacab4d9b9d2cb608a5b801867d383f9febeb32c7dd4ebeaf61023f&pb=U2FsdGVkX1_-mftdNhdH0NsaPqkQ__wfenntMBFkCZSoGhnkQRNHZLqfxKjGHNrI4fToD10THbGFBpOLdCEN79cKtusv5iqGyj6lSnVlv1s")
//            .previewLayout(.sizeThatFits)
//    }
//}
