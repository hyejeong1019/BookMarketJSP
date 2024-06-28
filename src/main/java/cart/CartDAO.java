package cart;

import java.util.List;

public interface CartDAO {
	//C
	int insert(CartItem item);
	//R
	CartItem select(int cartId, int loggedMemberNo);
	CartItem selectByBookId(int loggedMemberNo, int bookId);
	List<CartItem> selectAll(int loggedMemberNo);
	//U
	int update(int cartId, int loggedMemberNo, int quantity);
	//D
	int delete(int cartId, int loggedMemberNo);
	int deleteAll(int loggedMemberNo);
}
