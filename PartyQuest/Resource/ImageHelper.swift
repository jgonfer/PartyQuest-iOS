//
//  ImageHelper.swift
//  JGFLabRoom
//
//  Created by Josep González on 20/1/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//
/////////////////////////////////////////////////
//
// MARK: Class Explanation
// I created this class for a personal open source project that I have hosted in GitHub.
// The purpose of this class is to cache all the images downloaded from Internet and delete them when is needed to do.
//
/////////////////////////////////////////////////

import UIKit


class ImageHelper: NSObject {
    
    var cache = NSCache()
    var objs: [String]?
    
    static let sharedInstance = ImageHelper()
    
    override init() {
        super.init()
        
        cache = NSCache()
        cache.evictsObjectsWithDiscardedContent = true
        cache.delegate = self
    }
    
    func imageForUrl(urlString: String, completionHandler:(image: UIImage?, url: String) -> ()) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), {()in
            let data: NSData? = self.cache.objectForKey(urlString) as? NSData
            
            if let objs = self.objs {
                if !objs.contains(urlString) {
                    self.objs!.append(urlString)
                }
            } else {
                self.objs = [urlString]
            }
            
            if let goodData = data {
                let image = UIImage(data: goodData)
                dispatch_async(dispatch_get_main_queue(), {() in
                    completionHandler(image: image, url: urlString)
                })
                return
            }
            
            let downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                if (error != nil) {
                    completionHandler(image: nil, url: urlString)
                    return
                }
                
                if data != nil {
                    let image = UIImage(data: data!)
                    self.cache.setObject(data!, forKey: urlString, cost: 10)
                    dispatch_async(dispatch_get_main_queue(), {() in
                        completionHandler(image: image, url: urlString)
                    })
                    return
                }
            })
            downloadTask.resume()
        })
        
    }
    
    func cleanCache() {
        guard let objs = objs else {
            return
        }
        
        for obj: String in objs {
            guard let _ = cache.objectForKey(obj) else {
                continue
            }
            cache.removeObjectForKey(obj)
        }
        self.objs?.removeAll()
    }
}

extension ImageHelper: NSCacheDelegate {
    func cache(cache: NSCache, willEvictObject obj: AnyObject) {
        if let url = obj.key {
            //print("url" + url!)
        }
    }
}