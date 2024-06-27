package book;

import java.util.List;

import book.Book;
import book.BookDAO;
import book.BookService;

public class HJBookService implements BookService {

	BookDAO bookDao;
	
	public HJBookService(BookDAO bookDao) {
		this.bookDao = bookDao;
	}
	
	@Override
	public boolean regist(Book book){
		if (book == null) return false;
		int result = bookDao.insert(book);
		return (result == 1)? true : false;
	}

	@Override
	public Book detail(int id) {
		Book book = bookDao.select(id);
		return book;
	}

	@Override
	public List<Book> listAll() {
		List<Book> bookList = bookDao.selecAll();
		return bookList;
	}

	@Override
	public boolean edit(Book book) {
		if (book == null) return false;
		int result = bookDao.update(book);
		return (result == 1) ? true : false;
	}

	@Override
	public boolean remove(int id) {
		int result = bookDao.delete(id);
		return (result == 1) ? true : false;
	}

}
