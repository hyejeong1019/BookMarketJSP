package cart;

import java.util.List;

public interface CartService {
		boolean add(CartItem item);
		List<CartItem> listAll();
		boolean update(int id, int quantity);
		boolean remove(int id);
		boolean clear();
}
