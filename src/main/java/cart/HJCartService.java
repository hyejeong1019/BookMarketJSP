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
		CartItem inItem = cartDao.selectByBookId(item.getMemberNo(), item.getBookId());
		if (inItem == null) {
			System.out.println("책 추가");
			result = cartDao.insert(item);
		} else {
			int quantity = item.getQuantity() + inItem.getQuantity();
			System.out.println("수량 변경 :" + quantity);
			result = cartDao.update(inItem.getId(), item.getMemberNo(), item.getQuantity() + item.getQuantity());
		}
		
		return result == 1 ? true : false;
	}

	@Override
	public List<CartItem> listAll(int loggedMemberNo) {
		
		return cartDao.selectAll(loggedMemberNo);
	}

	@Override
	public boolean update(int cartId, int loggedMemberNo, int quantity) {
		
		int result = cartDao.update(cartId, loggedMemberNo, quantity);
		return result == 1 ? true : false;
		
	}

	@Override
	public boolean remove(int cartId, int loggedMemberNo) {
		
		int result = cartDao.delete(cartId, loggedMemberNo);
		return result == 1 ? true : false;
	}

	@Override
	public boolean clear(int loggedMemberNo) {
		
		int result = cartDao.deleteAll(loggedMemberNo);
		return result > 0 ? true : false;
	}

}
