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
		
		// bookId의 책이 이미 Cart에 있으면, 수량만 업데이트하기
		CartItem inCartItem = cartDao.selectByBookId(item.getMemberNo(), item.getBookId());
		if (inCartItem == null) {
			System.out.println("책 추가");
			result = cartDao.insert(item);
		} else {
			int quantity = item.getQuantity() + inCartItem.getQuantity();
			System.out.println("수량 변경 :" + quantity);
			result = cartDao.update(inCartItem.getCartId(), item.getMemberNo(), quantity);
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
