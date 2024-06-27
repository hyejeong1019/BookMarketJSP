package cart;

import java.util.List;

public interface CartDAO {
	//C
	int insert(CartItem item);
	//R
	CartItem select(int id);
	CartItem selectByBookId(int bookId);
	List<CartItem> selectAll();
	//U
	int update(int id, int quantity);
	//D
	int delete(int id);
	int deleteAll();
}
