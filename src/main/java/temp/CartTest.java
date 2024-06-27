package temp;

import cart.HJCartService;
import cart.ListCartDAO;

import java.util.List;

import cart.CartItem;
import cart.CartService;

public class CartTest {

	public static void main(String[] args) {
		
		CartService service = new HJCartService(new ListCartDAO());
		List<CartItem> itemList;
		
//		// C
//		service.add(new CartItem(2, 5));
//		service.add(new CartItem(5, 2));
//		
//		// R
//		itemList = service.listAll();
//		for (CartItem item : itemList)
//			System.out.println(item.toString());
//		
//		// C
//		service.add(new CartItem(2, 5));
		
		// R
		itemList = service.listAll();
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		// U
		service.update(1, 3);
		
		itemList = service.listAll();
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		// D
		service.clear();
		if (itemList.size() == 0)
			System.out.println("책이 없습니다.");

	}

}
