package cart;

public class CartItem {
	private int id;
	private int bookId;
	private int quantity;
	
	public CartItem (int bookId, int quantity) {
		this.bookId = bookId;
		this.quantity = quantity;
	}
	
	public CartItem (int id, int bookId, int quantity) {
		this.id = id;
		this.bookId = bookId;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItem [id=" + id + ", bookId=" + bookId + ", quantity=" + quantity + "]";
	}
	
}
