
import Foundation
class XmlParserManager: NSObject, XMLParserDelegate {
    
    var parser = XMLParser()
    var trend = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var title = NSMutableString()
    var link = NSMutableString()
    //var image:  [AnyObject] = []
    var image = NSMutableString()
    var fdescription = NSMutableString()
    var date = NSMutableString()
    var number = NSMutableString()
    
    // initilise parser
    func initWithURL(_ url :URL) -> AnyObject {
        startParse(url)
        return self
    }
    
    func startParse(_ url :URL) {
        trend = []
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    
    func allFeeds() -> NSMutableArray {
        return trend
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName as NSString
        if (element as NSString).isEqual(to: "item") {
            elements =  NSMutableDictionary()
            elements = [:]
            title = NSMutableString()
            title = ""
            link = NSMutableString()
            link = ""
            fdescription = NSMutableString()
            fdescription = ""
            date = NSMutableString()
            date = ""
            image = NSMutableString()
            image = ""
            number = NSMutableString()
            number = ""
        }
        //} else if (element as NSString).isEqual(to: "ht:picture") {
            //if let urlString = attributeDict["url"] {
              //  image.append(urlString as AnyObject)
            //}
        //}
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

        if (elementName as NSString).isEqual(to: "item") {
            if title != "" {
                elements.setObject(title, forKey: "title" as NSCopying)
            }
            if link != "" {
                elements.setObject(link, forKey: "link" as NSCopying)
            }
            if fdescription != "" {
                elements.setObject(fdescription, forKey: "description" as NSCopying)
            }
            if date != "" {
                elements.setObject(date, forKey: "pubDate" as NSCopying)
            }
            if image != "" {
                elements.setObject(image, forKey: "ht:picture" as NSCopying)
            }
            if number != "" {
                elements.setObject(number, forKey: "ht:approx_traffic" as NSCopying)
            }
            trend.add(elements)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let stringStrimg = string.trimmingCharacters(in: .whitespacesAndNewlines)
        if element.isEqual(to: "title") {
            title.append(stringStrimg)
        } else if element.isEqual(to: "link") {
            link.append(stringStrimg)
        } else if element.isEqual(to: "description") {
            fdescription.append(stringStrimg)
        } else if element.isEqual(to: "pubDate") {
            date.append(stringStrimg)
        }else if element.isEqual(to: "ht:picture"){
            image.append(stringStrimg)
        }else if element.isEqual(to: "ht:approx_traffic"){
            number.append(stringStrimg)
        }
    }
}
