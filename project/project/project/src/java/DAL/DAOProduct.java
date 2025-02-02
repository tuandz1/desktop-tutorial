/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import entity.Block;
import java.sql.Connection;
import java.sql.PreparedStatement;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOProduct {

    Connection conn;
    List<Product> pro;
    List<Brand> brand;
    List<Categories> cate;
    List<Block> bl;
    List<Product_Image> proimg;

    public List<Product_Image> getProimg() {
        return proimg;
    }

    public void setProimg(List<Product_Image> proimg) {
        this.proimg = proimg;
    }

    public List<Block> getBl() {
        return bl;
    }

    public void setBl(List<Block> bl) {
        this.bl = bl;
    }

    public List<Product> getPro() {
        return pro;
    }

    public void setPro(List<Product> pro) {
        this.pro = pro;
    }

    public List<Brand> getBrand() {
        return brand;
    }

    public void setBrand(List<Brand> brand) {
        this.brand = brand;
    }

    public List<Categories> getCate() {
        return cate;
    }

    public void setCate(List<Categories> cate) {
        this.cate = cate;
    }

    public DAOProduct() {
        conn = new DBContext().connection;
    }

    public void getAllBrand() {
        String sql = "SELECT [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand]";
        brand = new Vector<Brand>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String img = rs.getString(3);
                brand.add(new Brand(id, name, img));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getTop6Brand() {
        String sql = "SELECT Top 6 [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand]";
        brand = new Vector<Brand>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String img = rs.getString(3);
                brand.add(new Brand(id, name, img));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getTop4Brand() {
        String sql = "SELECT Top 4 [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand]";
        brand = new Vector<Brand>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String img = rs.getString(3);
                brand.add(new Brand(id, name, img));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void searchBrand(String txt) {
        String sql = "SELECT [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand] where [brand_name] like ?";
        brand = new Vector<Brand>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String img = rs.getString(3);
                brand.add(new Brand(id, name, img));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllBrandShop() {
        String sql = "SELECT [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand] where  [id] NOT IN (SELECT [brandid] FROM Block)";
        brand = new Vector<Brand>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String img = rs.getString(3);
                brand.add(new Brand(id, name, img));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllCate() {
        String sql = "SELECT [id]\n"
                + "      ,[ca_name]\n"
                + "  FROM [Categories]";
        cate = new Vector<Categories>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                cate.add(new Categories(id, name));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllProduct() {
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]"
                + " order by [stockQuantity] desc";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void gettop4Product() {
        String sql = "SELECT top 4 [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]"
                + " order by [stockQuantity] desc";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllProductShop() {
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product] where  [brand_id] NOT IN (SELECT [brandid] FROM Block)"
                + "and [stockQuantity] > 0";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllProductShopbyHigh() {
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product] where  [brand_id] NOT IN (SELECT [brandid] FROM Block)"
                + "and [stockQuantity] != 0 "
                + "  order by price desc";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllProductShopbyLow() {
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product] where  [brand_id] NOT IN (SELECT [brandid] FROM Block)"
                + "and [stockQuantity] != 0 "
                + "order by price asc";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();

        List<Product> list = dao.fuzzySearchProducts("rolix", 50, 15);
        for (Product product : list) {
            System.out.println(product.getProName());
        }

    }

    public void searchProduct(String txt) {
        String sql = "SELECT p.[id],\n"
                + "       p.[proName],\n"
                + "       p.[caid],\n"
                + "       p.[description],\n"
                + "       p.[img],\n"
                + "       p.[price],\n"
                + "       p.[rate],\n"
                + "       p.[brand_id],\n"
                + "       p.[stockQuantity],\n"
                + "       p.[publication_date]\n"
                + "FROM [Product] p\n"
                + "JOIN [Brand] b ON p.[brand_id] = b.[id]\n"
                + "JOIN [Categories] c ON p.[caid] = c.[id]";
        if (txt != null) {
            sql += "WHERE p.[proName] LIKE ?\n"
                    + "   OR p.[description] LIKE ?\n"
                    + "   OR c.[ca_name] LIKE ?\n"
                    + "   OR b.[brand_name] LIKE ?;";
        }
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            String searchTxt = "%" + txt + "%";
            ps.setString(1, searchTxt);
            ps.setString(2, searchTxt);
            ps.setString(3, searchTxt);
            ps.setString(4, searchTxt);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void searchProductShop(String txt) {
        String sql = "SELECT TOP (1000) p.[id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product] p \n"
                + "  JOIN [Brand] b ON p.[brand_id] = b.[id]\n"
                + "  JOIN [Categories] c ON p.[caid] = c.[id]\n"
                + "  WHERE   p.[brand_id] NOT IN (SELECT [brandid] FROM Block)"
                + "and [stockQuantity] != 0";
        if (txt != null) {
            sql += " And (p.[proName] LIKE ?\n"
                    + "  OR p.[description] LIKE ?\n"
                    + "  OR c.[ca_name] LIKE ?\n"
                    + "  OR b.[brand_name] LIKE ?)";
        }
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            String searchTxt = "%" + txt + "%";
            ps.setString(1, searchTxt);
            ps.setString(2, searchTxt);
            ps.setString(3, searchTxt);
            ps.setString(4, searchTxt);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getBestProduct() {
        String sql = "SELECT p.*\n"
                + "FROM Product p\n"
                + "JOIN (\n"
                + "    SELECT TOP 8 product_id, COUNT(product_id) AS product_count\n"
                + "    FROM orderdetail\n"
                + "    GROUP BY product_id\n"
                + "    ORDER BY product_count DESC\n"
                + ") od ON p.id = od.product_id\n"
                + "where   [brand_id] NOT IN (SELECT [brandid] FROM Block) and [stockQuantity] > 0\n"
                + "ORDER BY od.product_count DESC;";
        pro = new Vector<Product>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public Product getProductbyId(int proid) {
        Product product = new Product();
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]\n"
                + "  Where id = ?;";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                product = new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return product;
    }

    public Product getProductbyName(String proname) {
        Product product = new Product();
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]\n"
                + "  Where [proName] = ?;";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, proname);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                product = new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return product;
    }

    public void getProductbyBrandId(int proid) {
        pro = new Vector<>();
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]\n"
                + "  Where brand_id = ? and  [brand_id] NOT IN (SELECT [brandid] FROM Block) "
                + "and [stockQuantity] != 0";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getProductbyCateId(int proid) {
        pro = new Vector<>();
        String sql = "SELECT [id]\n"
                + "      ,[proName]\n"
                + "      ,[caid]\n"
                + "      ,[description]\n"
                + "      ,[img]\n"
                + "      ,[price]\n"
                + "      ,[rate]\n"
                + "      ,[brand_id]\n"
                + "      ,[stockQuantity]\n"
                + "      ,[publication_date]\n"
                + "  FROM [Product]\n"
                + "  Where caid = ? and  [brand_id] NOT IN (SELECT [brandid] FROM Block) "
                + "and [stockQuantity] != 0";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int caid = rs.getInt(3);
                String description = rs.getString(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);
                float rate = rs.getFloat(7);
                int brand_id = rs.getInt(8);
                int stockQuantity = rs.getInt(9);
                String publication_date = rs.getString(10);
                pro.add(new Product(id, name, caid, description, img, price, rate, brand_id, stockQuantity, publication_date));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllProductPagging(List<Product> newsList, int start, int end) {
        pro = new Vector<Product>();
        for (int i = start; i < end; i++) {
            pro.add(newsList.get(i));
        }
    }

    public void InsertProduct(String name, int caid, String des, String img, double price, int brid, int stock, String date) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([proName]\n"
                + "           ,[caid]\n"
                + "           ,[description]\n"
                + "           ,[img]\n"
                + "           ,[price]\n"
                + "           ,[brand_id]\n"
                + "           ,[stockQuantity]\n"
                + "           ,[publication_date])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, caid);
            ps.setString(3, des);
            ps.setString(4, img);
            ps.setDouble(5, price);
            ps.setInt(6, brid);
            ps.setInt(7, stock);
            ps.setString(8, date);

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateProduct(String name, int caid, String des, String img, double price, int brid, int stock, String date, int proid) {
        String sql = "UPDATE [Product]\n"
                + "   SET [proName] = ?\n"
                + "      ,[caid] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[brand_id] = ?\n"
                + "      ,[stockQuantity] = ?\n"
                + "      ,[publication_date] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, caid);
            ps.setString(3, des);
            ps.setString(4, img);
            ps.setDouble(5, price);
            ps.setInt(6, brid);
            ps.setInt(7, stock);
            ps.setString(8, date);
            ps.setInt(9, proid);

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void createCate(String name) {
        String sql = "INSERT INTO [Categories]\n"
                + "           ([ca_name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void createBrand(String name, String img) {
        String sql = "INSERT INTO [brand]\n"
                + "           ([brand_name]\n"
                + "           ,[brand_img])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void blockBrand(int id) {
        String sql = "INSERT INTO [Block]\n"
                + "           ([proid]\n"
                + "           ,[accid]\n"
                + "           ,[brandid])\n"
                + "     VALUES\n"
                + "           (0,0,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void activeBrand(int id) {
        String sql = "DELETE FROM [Block]\n"
                + "      WHERE [brandid] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void getBlockBrand() {
        String sql = "SELECT [proid]\n"
                + "      ,[accid]\n"
                + "      ,[brandid]\n"
                + "  FROM [Block]\n"
                + "  WHERE [proid] = 0\n"
                + "    AND [accid] = 0";
        bl = new Vector<Block>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int proid = rs.getInt(1);
                int accid = rs.getInt(2);
                int brandid = rs.getInt(3);

                bl.add(new Block(proid, accid, brandid));
            }
        } catch (SQLException e) {

        }
    }

    public void getProImagebyId(int pro_id) {
        String sql = "SELECT [id]\n"
                + "      ,[pro_id]\n"
                + "      ,[img_link]\n"
                + "  FROM [ProductImg]\n"
                + "  Where [pro_id] = ?";
        proimg = new Vector<Product_Image>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pro_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int proid = rs.getInt(2);
                String img = rs.getString(3);

                proimg.add(new Product_Image(id, proid, img));
            }
        } catch (SQLException e) {

        }
    }

    public void DeleteProduct(int id) {

        String sql = "UPDATE [Product]\n"
                + "   SET [stockQuantity] = -1"
                + "      WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateBrand(int id, String name, String img) {
        String sql = "UPDATE [brand]\n"
                + "   SET [brand_name] = ?\n"
                + "      ,[brand_img] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteBrand(int id) {
        String sql = "DELETE FROM [dbo].[brand]\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteProductImg(int id) {
        String sql = "DELETE FROM [ProductImg]\n"
                + "      WHERE [pro_id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertProImage(int proid, String img) {
        String sql = "INSERT INTO [dbo].[ProductImg]\n"
                + "           ([pro_id]\n"
                + "           ,[img_link])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ps.setString(2, img);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateCate(int cateid, String name) {
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET [ca_name] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, cateid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteCate(int cateid) {
        String sql = "DELETE FROM [Categories]\n"
                + "      WHERE [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cateid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Brand getBrandnyId(int braid) {
        Brand bra = new Brand();
        String sql = "SELECT [id]\n"
                + "      ,[brand_name]\n"
                + "      ,[brand_img]\n"
                + "  FROM [brand]\n"
                + "  where [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, braid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String brand_img = rs.getString(3);

                bra = new Brand(id, name, brand_img);
            }
        } catch (SQLException e) {

        }
        return bra;
    }

    public Categories getCatebyId(int cateid) {
        Categories cate = new Categories();
        String sql = "SELECT  [id]\n"
                + "      ,[ca_name]\n"
                + "  FROM [Categories]\n"
                + "  where [id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cateid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String ca_name = rs.getString(2);

                cate = new Categories(id, ca_name);
            }
        } catch (SQLException e) {

        }
        return cate;
    }

    public int getCountProbyBrand(int brandid) {
        int procount = 0;
        Categories cate = new Categories();
        String sql = "SELECT COUNT(id)\n"
                + "  FROM [Product]\n"
                + "  where brand_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, brandid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public int getCountProbyCate(int cateid) {
        int procount = 0;
        Categories cate = new Categories();
        String sql = "SELECT COUNT(id)\n"
                + "  FROM [betashop].[dbo].[Product]\n"
                + "  where [caid] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cateid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public int getCountCustomer() {
        int procount = 0;
        Categories cate = new Categories();
        String sql = "SELECT COUNT(id)\n"
                + "  FROM [Account]\n"
                + "  where role_id = 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public int getCountBrands() {
        int procount = 0;
        Categories cate = new Categories();
        String sql = "SELECT  count(id)\n"
                + "  FROM [brand]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public int getCountProducts() {
        int procount = 0;
        Categories cate = new Categories();
        String sql = "SELECT  count(id)\n"
                + "  FROM [Product]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public int getCountCate() {
        int procount = 0;

        String sql = "SELECT  count(id)\n"
                + "  FROM [Categories]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                procount = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return procount;
    }

    public List<Product> fuzzySearchProducts(String searchTerm, int maxDistance, int maxResults) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Product"; // Câu SQL có thể điều kiện theo ID

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productName = rs.getString(2);
                int distance = StringUtil.levenshteinDistance(searchTerm.toLowerCase(), productName.toLowerCase());

                // Điều kiện để bỏ qua kết quả khi khoảng cách lớn hơn maxDistance
                if (distance <= maxDistance) {
                    int id = rs.getInt(1);
                    int caid = rs.getInt(3);
                    String description = rs.getString(4);
                    String img = rs.getString(5);
                    double price = rs.getDouble(6);
                    float rate = rs.getFloat(7);
                    int brand_id = rs.getInt(8);
                    int stockQuantity = rs.getInt(9);
                    String publication_date = rs.getString(10);

                    Product product = new Product(id, productName, caid, description, img, price, rate, brand_id, stockQuantity, publication_date);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Sắp xếp danh sách kết quả theo độ tương đồng giảm dần
        Collections.sort(productList, new Comparator<Product>() {
            @Override
            public int compare(Product p1, Product p2) {
                int dist1 = StringUtil.levenshteinDistance(searchTerm.toLowerCase(), p1.getProName().toLowerCase());
                int dist2 = StringUtil.levenshteinDistance(searchTerm.toLowerCase(), p2.getProName().toLowerCase());
                return Integer.compare(dist1, dist2);
            }
        });

        // Loại bỏ các từ trùng lặp dựa trên kí tự đã sử dụng
        List<Product> filteredList = new ArrayList<>();
        Set<Character> usedChars = new HashSet<>();
        for (Product product : productList) {
            boolean hasDuplicate = false;
            for (char c : searchTerm.toLowerCase().toCharArray()) {
                if (product.getProName().toLowerCase().indexOf(c) != -1) {
                    if (usedChars.contains(c)) {
                        hasDuplicate = true;
                        break;
                    } else {
                        usedChars.add(c);
                    }
                }
            }
            if (!hasDuplicate) {
                filteredList.add(product);
            }
            // Reset usedChars set for the next product
            usedChars.clear();
        }

        // Giới hạn số lượng kết quả trả về theo maxResults
        if (filteredList.size() > maxResults) {
            filteredList = filteredList.subList(0, maxResults);
        }
        Collections.reverse(filteredList);
        return filteredList;
    }
}
