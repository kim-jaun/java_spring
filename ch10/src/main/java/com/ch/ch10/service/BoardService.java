package com.ch.ch10.service;
import java.util.List;
import com.ch.ch10.model.Board;
public interface BoardService {
	// List<Board> list(int startRow, int endRow);
	List<Board> list(Board board);
	int insert(Board board);
//	int getTotal();
	int getTotal(Board board);
	void updateReadcount(int num);
	Board select(int num);
	int update(Board board);
	int delete(int num);
	int maxNum();
	void updateStep(Board board);

}