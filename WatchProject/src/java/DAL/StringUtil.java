/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author admin
 */
public class StringUtil {
     // Hàm tính toán Levenshtein Distance giữa hai chuỗi
     public static int levenshteinDistance(String s1, String s2) {
        int[][] dp = new int[s1.length() + 1][s2.length() + 1];

        for (int i = 0; i <= s1.length(); i++) {
            for (int j = 0; j <= s2.length(); j++) {
                if (i == 0) {
                    dp[i][j] = j;
                } else if (j == 0) {
                    dp[i][j] = i;
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1] + costOfSubstitution(s1.charAt(i - 1), s2.charAt(j - 1)),
                                   dp[i - 1][j] + 1,
                                   dp[i][j - 1] + 1);
                }
            }
        }

        return dp[s1.length()][s2.length()];
    }

    // Hàm tính giá trị chi phí thay thế giữa hai ký tự
    private static int costOfSubstitution(char a, char b) {
        return a == b ? 0 : 1;
    }

    // Hàm trả về giá trị nhỏ nhất trong ba số
    private static int min(int a, int b, int c) {
        return Math.min(a, Math.min(b, c));
    }
}
