import UIKit

let names: [String] = ["bibi", "coco", "ruru"]
var uppercasedNames: [String]
uppercasedNames = names.reduce(into: [], {
    print("$n : \($0), $n+1 : \($1)")
//    $n : [], $n+1 : bibi
//    $n : ["BIBI"], $n+1 : coco
//    $n : ["BIBI", "COCO"], $n+1 : ruru
    $0.append($1.uppercased())
})
print(uppercasedNames) // ["BIBI", "COCO", "RURU"]
