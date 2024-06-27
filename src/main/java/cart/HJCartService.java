package cart;

import java.util.List;

public class HJCartService implements CartService {
	
	CartDAO cartDao;
	
	public HJCartService(CartDAO cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public boolean add(CartItem item) {
		
		if (item == null) return false;
		
		int result = 0;
		
		// 장바구니에 같은 책이 있는지 확인한다. --> bookId로 확인
		CartItem inItem = cartDao.selectByBookId(item.getBookId());
		if (inItem == null) {
			System.out.println("책 추가");
			result = cartDao.insert(item);
		} else {
			int quantity = item.getQuantity() + inItem.getQuantity();
			System.out.println("수량 변경 :" + quantity);
			result = cartDao.update(inItem.getId(), inItem.getQuantity() + item.getQuantity());
		}
		
		return result == 1 ? true : false;
	}

	@Override
	public List<CartItem> listAll() {
		
		return cartDao.selectAll();
	}

	@Override
	public boolean update(int id, int quantity) {
		
		int result = cartDao.update(id, quantity);
		return result == 1 ? true : false;
		
	}

	@Override
	public boolean remove(int id) {
		
		int result = cartDao.delete(id);
		return result == 1 ? true : false;
	}

	@Override
	public boolean clear() {
		
		cartDao.deleteAll();
		
		return cartDao.selectAll().size() == 0 ? true : false;
	}

}
