package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.BoardGameComment;

public interface BGCommentDAO {

	BoardGameComment findBGCommentById(int id);

	List<BoardGameComment> findBGCommentByBoardGame(String user);

	List<BoardGameComment> findBGCommentByUser(String user);

	BoardGameComment create(BoardGameComment comment);

	BoardGameComment update(int id, BoardGameComment comment);

	boolean destroy(int id);

}