package com.skilldistillery.gamebored.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.gamebored.data.BGCommentDAO;
import com.skilldistillery.gamebored.data.BoardGameDAO;
import com.skilldistillery.gamebored.data.CCommentDAO;
import com.skilldistillery.gamebored.entities.BoardGameComment;
import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.Category;
import com.skilldistillery.gamebored.entities.CommunityComment;
import com.skilldistillery.gamebored.entities.Genre;
import com.skilldistillery.gamebored.entities.Publisher;

@Controller
public class BoardGameController {
	
	@Autowired
	private BoardGameDAO boardGameDAO;
	
	@Autowired
	private BGCommentDAO bgDao;
	@Autowired
	private CCommentDAO cDao;
	
	@RequestMapping(path={"/", "homepage.do"}, method = RequestMethod.GET)
	public String backHome(Model model) {
			List<Boardgame> gameList = boardGameDAO.findAll();
			model.addAttribute("gameList", gameList);
			List<CommunityComment> comments =cDao.listAllCommunityComments();
			model.addAttribute("commentsList", comments);
		return "homepage";
	}
	
	@RequestMapping(path="getGame.do", method = RequestMethod.GET)
	public String showGameByID(Integer id, Model model) {
		Boardgame game = boardGameDAO.findById(id);
		model.addAttribute("game", game);
		return "SingleBoardGameDisplay";
	}
	
//	@RequestMapping(path="gameMakerTest.do", method = RequestMethod.POST)
//	public String listOfAllGames(Model model) {
//		Boardgame game = new Boardgame();
//		model.addAttribute("gametest", game);
//		return "SingleBoardGameDisplay";
//	}
	
	@RequestMapping(path="gameList.do", method = RequestMethod.GET)
	public String getGamesByKeyword(String searchTerm, String searchType, Model model) {
		List<Boardgame> gameList;
		switch (searchType) {
		case "genre" :
			gameList = boardGameDAO.findGameByGenre(searchTerm);
			break;
		case "category" :
			gameList = boardGameDAO.findGameByCategory(searchTerm);
			break;
		case "publisher" :
			gameList = boardGameDAO.findGameByPublisher(searchTerm);
			break;
		case "numPlayers" :
			try {
				int numOfPlayers = Integer.parseInt(searchTerm);
				gameList = boardGameDAO.findGameByNumberOfPlayers(numOfPlayers);
			} catch (NumberFormatException e) {
				gameList = new ArrayList<>();
				System.err.println("Invalid number format with search term number of players: " + searchTerm);
			}
			break;
		case "keyword" :
			default:
			gameList = boardGameDAO.findGameByKeyword(searchTerm);
			break;
			
		}
		model.addAttribute("games", gameList);
		return "listofgames";
	}
	

	@RequestMapping(path = "newGameForm.do", method = RequestMethod.GET)
	public String redirToNewGameForm(Model model, HttpSession session) {
		model.addAttribute("categories", boardGameDAO.getAllCategories());
		model.addAttribute("genres", boardGameDAO.getAllGenres());
		model.addAttribute("publishers", boardGameDAO.getAllPublishers());
		return "addnewgame";
	}
	
	@RequestMapping(path = "addGame.do", method = RequestMethod.POST)
	public String addGame(Boardgame boardgame, int pubId, int genId, int catId, Model model, RedirectAttributes redir) {
		Boardgame bgame = boardGameDAO.addGame(boardgame, pubId, genId, catId);
		redir.addFlashAttribute("game", bgame);
		return "redirect:gameAdded.do";
	}
	@RequestMapping(path = "gameAdded.do", method = RequestMethod.GET)
	public String addGameRedir() {
		return "SingleBoardGameDisplay";
	}
	
	@RequestMapping(path = "goToUpdateForm.do", method = RequestMethod.GET)
	public String goToUpdateForm(Integer id, Model model) {
		model.addAttribute("game", boardGameDAO.findById(id));
		model.addAttribute("categories", boardGameDAO.getAllCategories());
		model.addAttribute("genres", boardGameDAO.getAllGenres());
		model.addAttribute("publishers", boardGameDAO.getAllPublishers());
		return "updategame";
	}
	
	@RequestMapping(path = "updateGame.do", method = RequestMethod.POST )
	public String updateGame(Boardgame bgame, int pubId, int genId, int catId, Model model) {
		Boardgame updateGame = boardGameDAO.updateGame(bgame, pubId, genId, catId);
		model.addAttribute("game", updateGame);
		return "SingleBoardGameDisplay";
	}
	
	
	@RequestMapping(path = "deleteGame.do", method = RequestMethod.POST)
	public String deleteGame(Integer id, RedirectAttributes redir) {
		boardGameDAO.deleteGame(id);
		return("redirect:gameDeleted.do");
	}
	
	@RequestMapping(path = "gameDeleted.do", method = RequestMethod.GET)
	public String deleted() {
		return "Deleted";
	}
	
	
	
	//Delete this method
	@RequestMapping(path={"getBGComments.do"}, method = RequestMethod.GET)
	public String getBGComments(Model model) {
			List<BoardGameComment> comments = boardGameDAO.findAllCommentsForGame();
			model.addAttribute("comments", comments);
		return "SingleBoardGameDisplay";
	}
}
