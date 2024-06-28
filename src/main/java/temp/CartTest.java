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
		service.add(new CartItem(9, 3, 1));
		service.add(new CartItem(9, 6, 2));
//		
//		// R
		itemList = service.listAll(9);
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		// U
		service.update(1, 9, 3);
		itemList = service.listAll(9);
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		service.remove(2, 9);
		itemList = service.listAll(9);
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		if (service.clear(9))
			System.out.println("책이 없습니다.");

		
//		// C
//		service.add(new CartItem(2, 5));
		
		// R
		/*
		itemList = service.listAll();
		for (CartItem item : itemList)
			System.out.println(item.toString());
		
		
		// D
*/
	}

}
