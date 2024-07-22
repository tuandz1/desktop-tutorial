/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import DAL.DAOProduct;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {

    private List<Items> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Items> getItems() {
        return items;
    }

    public int getQuantitybyID(int id) {
        return getItemsbyId(id).getQuantity();
    }

    private Items getItemsbyId(int id) {
        for (Items item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItems(Items i) {
        if (getItemsbyId(i.getProduct().getId()) != null && (i.getAccid() != 0)) {
            Items m = getItemsbyId(i.getProduct().getId());
            m.setQuantity(m.getQuantity() + i.getQuantity());
            m.setAccid(i.getAccid());
        } else {
            items.add(i);
        }
    }

       public void removeItem(int productId, int accountId) {
        Iterator<Items> iterator = items.iterator();
        while (iterator.hasNext()) {
            Items item = iterator.next();
            if (item.getProduct().getId() == productId && item.getAccid() == accountId) {
                iterator.remove();
                break; // Remove only the first matching item
            }
        }
    }

    public double getTotalMoney(int accid) {
        double t = 0;
        for (Items item : items) {
            if(item.getAccid() == accid){
            t += (item.getQuantity() * item.getPrice());
            }
        }
        return t;
    }

    public Product getProByid(int id, List<Product> list) {
        for (Product product : list) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("bbb");
                for (String string : s) {
                    String[] n = string.split("sssc");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    int accid = Integer.parseInt(n[2]);
                    Product p = getProByid(id, list);
                    Items i = new Items(p, quantity, p.getPrice(),accid);
                    addItems(i);
                }
            }
        } catch(Exception e) {

        }
    }
    
    public int countItemsByAccountId(int accountId) {
        int count = 0;
        for (Items item : items) {
            if (item.getAccid() == accountId) {
                count++;
            }
        }
        return count;
    }
    
    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        dao.getAllProduct();
        List<Product> pro = dao.getPro();
        
        Cart c = new Cart("13sssc1sssc42bbb27sssc1sssc42bbb9sssc1sssc42bbb28sssc1sssc42", pro);
       int n = c.countItemsByAccountId(42);
        System.out.println(n);
    }
    
}
