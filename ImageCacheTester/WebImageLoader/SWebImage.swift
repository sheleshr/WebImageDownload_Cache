//
//  NetworkImageCache.swift
//  NetworkImageCache
//
//  Created by Administrator on 23/06/23.
//
import UIKit
import SwiftUI


fileprivate let imageDownloader = ImageDownlaoder(imageCache: ToDownlaodsFolderCache())


protocol Cachable{
    var cacheStoreLocation:URL {get}
    func imageNameFrom(url:URL)->String
    func storeIn(image:UIImage, for name:String) async throws
    func imageFrom(name:String)async throws -> UIImage?
    func removeFor(name:String) async throws
    func removeAll() async throws
}
class ToDownlaodsFolderCache:Cachable{
    var cacheStoreLocation: URL{
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Downloads")
    }
    func imageNameFrom(url:URL)->String{
        //let str = (url.host ?? "nohost").appending("_".appending(url.lastPathComponent))
        //return str
        //return url.absoluteString
        let str = url.relativePath.replacingOccurrences(of: "/", with: "_")
        return str
    }
    func storeIn(image: UIImage, for name: String) async throws{
        if let data = image.jpegData(compressionQuality: 0.1) {
            do {
                
                if !FileManager.default.fileExists(atPath: cacheStoreLocation.path) {
                    try FileManager.default.createDirectory(atPath: cacheStoreLocation.path, withIntermediateDirectories: true, attributes: nil)
                }
                let url = self.cacheStoreLocation.appending(path: name)
                try data.write(to: url)
            } catch let error as NSError {
                print("Error creating directory: \(error.localizedDescription)")
            }
                
            }
    }
    
    func imageFrom(name: String) async throws -> UIImage? {
        let url = self.cacheStoreLocation.appending(path: name)
        if let imageData = try? Data(contentsOf: url){
            return UIImage(data: imageData) //.imageResized(to: CGSize(width: 150, height: 200)
        }else{
            return nil
        }
    }
    
    func removeFor(name:String) async throws {
        let fm = FileManager.default
        let url = cacheStoreLocation.appending(component: name)
        try fm.removeItem(at: url)
    }
    
    func removeAll() async throws{
        let fm = FileManager.default
        try fm.removeItem(at: cacheStoreLocation)
    }
    
    
}
//class ToNSChache:Cachable{

//}

//********************


protocol DownloadQueuable{
    func addDownloading(url:URL, callback:@escaping (UIImage?)->Void)async throws
    func stopAllDownloading() async
}

actor ImageDownlaoder:DownloadQueuable{
    private var callbacksWithURL = [String:(UIImage?)->Void]()

    let imageCache:Cachable
    init(imageCache: Cachable) {
        self.imageCache = imageCache
    }
    func addDownloading(url:URL, callback:@escaping (UIImage?)->Void)async throws {
            if callbacksWithURL.keys.first(where: {$0 == url.absoluteString}) == nil
            {
                callbacksWithURL[url.absoluteString] = callback
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
                var image = UIImage(data: data)
                if let img = image{
                    let smallImg = img.imageResized(to: CGSize(width: 150, height: 200))
                    image = nil
                    let imgName = imageDownloader.imageCache.imageNameFrom(url: url)
                    let filePath = imageDownloader.imageCache.cacheStoreLocation.appending(component: imgName).absoluteString
                    if !FileManager.default.fileExists(atPath: filePath) {
                        try await self.imageCache.storeIn(image:smallImg , for:imgName)
                    }
                    if let tcallback = callbacksWithURL[url.absoluteString]{
                        tcallback(smallImg)
                        callbacksWithURL[url.absoluteString] = nil
                    }
                }else{
                    if let tcallback = callbacksWithURL[url.absoluteString]{
                        tcallback(nil)
                        callbacksWithURL[url.absoluteString] = nil
                    }
                }
                
            }
            else{
                callbacksWithURL[url.absoluteString] = callback
            }
    }
    func stopAllDownloading() async{
        callbacksWithURL.removeAll()
    }
}
//*******************************************************

protocol UIImageViewFetchable {
    func setImageFor(url:URL?, placeholder:UIImage?)
}

class SWebImageView :UIImageView, UIImageViewFetchable{
    var lastUrl:URL?
    var imageTask = [Task<Void,Error>]()
    
    func setImageFor(url:URL?, placeholder:UIImage?){
        if let p = placeholder{
            self.image = p
           
        }
        if let turl = url {
            lastUrl = turl
            
            let tTask =  Task{
                let name = imageDownloader.imageCache.imageNameFrom(url: turl)
                if let img = try? await imageDownloader.imageCache.imageFrom(name:name)
                {
                    DispatchQueue.main.async {
                        self.image = img
                    }
                }else{
                    try await imageDownloader.addDownloading(url: turl,callback: {[weak self] img in
                        if let timage = img, turl.absoluteString == self?.lastUrl!.absoluteString{
                                DispatchQueue.main.async {
                                    self?.image = timage
                                }
                        }
//                        else{//ignore}
                        })
                }
            }
            imageTask.append(tTask)
        }
    }
    
    deinit{
        imageTask.forEach { task in
            task.cancel()
        }
        imageTask.removeAll()
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
//*********************
struct SWebImageSwiftUI:View{
    let url:URL?
    @State var image:UIImage?
    var body: some View{
        ZStack{
            if let img = image{
                Image(uiImage: img).resizable()
            }else{
                //Image(systemName: "hourglass").resizable().frame(width:50, height: 75)
                ProgressView().progressViewStyle(.circular).foregroundColor(.black)
            }
        }
        .onAppear{
          Task{
               try await webImage()
            }
        }
        .onDisappear{
            image = nil
            
        }
    }
    func webImage()async throws{
        if let turl = url {
                let name = imageDownloader.imageCache.imageNameFrom(url: turl)
                if let img = try? await imageDownloader.imageCache.imageFrom(name:name)
                {
                    image = img
                }else{

                   try await imageDownloader.addDownloading(url: turl, callback: { img in
                       if let timage = img{
                           image = timage
                       }
                    })

                }
        }

    }
}
