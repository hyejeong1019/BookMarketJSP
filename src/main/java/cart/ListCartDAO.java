package cart;

import java.util.ArrayList;
import java.util.List;

public class ListCartDAO implements CartDAO {
	
	static private List<CartItem> itemList = new ArrayList<>();
	static private int cart_seq = 0;
	
	@Override
	public int insert(CartItem item) {
		int result = 0;
		
		item.setId(++cart_seq);
		if (itemList.add(item)) result = 1;
		
		return result;
	}

	@Override
	public CartItem select(int id) {
		for (CartItem item : itemList) {
			if (item.getId() == id)
				return item;
		}
		return null;
	}

	@Override
	public CartItem selectByBookId(int bookId) {

		for (CartItem item : itemList) {
			if (item.getBookId() == bookId)
				return item;
		}
		return null;
	}

	@Override
	public List<CartItem> selectAll() {
	
		return itemList;
	}

	@Override
	public int update(int id, int quantity) {
		
		int result = 0;
		
		CartItem item = select(id);
		if(item != null) {
			System.out.println("update (" + id + ")" + quantity);
			item.setQuantity(quantity);
			result = 1;
		}
		
		return result;
	}

	@Override
	public int delete(int id) {
		
		int result = 0;
		
		CartItem item = select(id);
		if (item != null && itemList.remove(item)) {
			result = 1;
		}
		return result;
	}

	@Override
	public int deleteAll() {
	
		int result = itemList.size();
		
		itemList.clear();
		
		return result;
	}

}
