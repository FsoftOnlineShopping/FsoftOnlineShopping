/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ハン
 */
public class CartItem {
    private List<Item> items;
    
    public CartItem() {
        items = new ArrayList<>();
    }

    public CartItem(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    
    
    private Item getItemById(int id) {
        for(Item i:items) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }
    
    public void addItem(Item t) {
//        alr inside cart
        if (getItemById(t.getProduct().getProductID()) != null) {
            Item i = getItemById(t.getProduct().getProductID());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
//            not inside cart
            items.add(t);
        }
    }
    
    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public float getTotalMoney() {
        float t = 0;
        for (Item i:items) {
            t += i.getQuantity()*i.getPrice();
        }
        return t;
    }
}
