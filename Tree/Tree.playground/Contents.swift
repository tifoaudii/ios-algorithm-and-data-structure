import UIKit

public class TreeNode<T> {
    
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    /*
     Tiap node memegang sebuah data dan reference ke semua childnya menggunakan array.
     **/
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

let beverages = TreeNode("Beverages")

let tea = TreeNode("Tea")
let coffee = TreeNode("Coffee")

beverages.add(tea)
beverages.add(coffee)

/*
        Beverage
    /           \
 Tea              Coffee
 **/


/*
 Traversal Algorithm
 
 Untuk bisa melakukan traversal ke semua data pada struktur data linear bisa dilakukan dengan mudah pada linkedlist ataupun array. Namun untuk struktur data trees, sedikit lebih rumit. Ada beberapa strategi traversal yang bisa dilakukan pada trees yang mana bergantung pada problem yang ingin diselesaikan.
 
 1. Depth-first traversal
 sebuah metode traversal yang mulai dari root hingga menjelajah sedalam mungkin sebelum melakukan backtracking.
 
 **/

extension TreeNode {
    public func depthFirstTraversal(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.depthFirstTraversal(visit: visit)
        }
    }
}


/**
 
 Untuk melakukan depth first traversal, dapat digunakan cara rekursif. Pada function tersebut, menerima argument bertipe closure yang mana closure tersebut bisa kita implemen sesuai kebutuhan, dalam hal ini kita hanya akan melakukan print value dari tiap node.
 Mari kita coba function tersebut dengan membuat tree yang memiliki banyak node.
 
 */

public func createTree() -> TreeNode<String> {
    let tree = TreeNode<String>("Food")
    let western = TreeNode<String>("western")
    let asia = TreeNode<String>("asia")
    let steak = TreeNode<String>("steak")
    let pizza = TreeNode<String>("pizza")
    let pasta = TreeNode<String>("pasta")
    let meatLover = TreeNode<String>("meat lover")
    let cheeseLover = TreeNode<String>("cheese lover")
    let americanFavorite = TreeNode<String>("american favorite")
    let sushi = TreeNode<String>("sushi")
    let chineseFood = TreeNode<String>("chinese food")
    let sashimi = TreeNode<String>("sashimi")
    
    tree.add(western)
    tree.add(asia)
    
    western.add(pizza)
    western.add(steak)
    western.add(pasta)
    
    asia.add(sushi)
    asia.add(chineseFood)
    
    pizza.add(meatLover)
    pizza.add(cheeseLover)
    pizza.add(americanFavorite)
    
    sushi.add(sashimi)
    
    return tree
}

/*
 
                            food
            western                             asia
 pizza      steak       pasta           sushi           chineseFood
ml  cl  af                              sashimi
 
 **/

let foodTree: TreeNode<String> = createTree()
foodTree.depthFirstTraversal(visit: {
    print($0.value)
})




