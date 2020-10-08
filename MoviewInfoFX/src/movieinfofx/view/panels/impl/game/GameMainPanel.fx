/*
 * MainGamePanel.fx
 *
 * Created on 06/02/2010, 20:53:00
 */
package movieinfofx.view.panels.impl.game;


import movieinfofx.view.panels.searchPanels.SearchInfoPair;
import movieinfofx.view.panels.impl.game.GameSearchResultsPanel;
import movieinfofx.ivaapi.reader.impl.GameReader;
import movieinfofx.ivaapi.model.Game;
import movieinfofx.util.CategoryUtil;
import movieinfofx.view.panels.MainPanel;
import movieinfofx.view.panels.searchPanels.SearchNode;

/**
 * @author william
 */
public class GameMainPanel extends MainPanel {

    public var gameResultsPanel: GameSearchResultsPanel =
            GameSearchResultsPanel {
                panelStyle: bind panelStyle;
                width: width - 30;                
                searchingStatus: bind gameReader.searchingStatus;
            };
    override var searchResultsPanel = bind gameResultsPanel;
    var gameReader: GameReader = GameReader {
                };
    var searchByTitle: SearchInfoPair;
    override var panelTitle = "Game Search";
    var searchByGenre: SearchInfoPair;
    //This is to fix a bug on API, we will fill the genre
    public var genre: String;

    override public function getSearchPanels():SearchNode[] {
        [
            searchByTitle = SearchInfoPair {
                panelStyle: bind panelStyle;
                action: searchByTitleAction;
                info: "Title";
                searchName: "Search By Game Title"
                values: null;
                hold: bind searching;
            },
            searchByGenre = SearchInfoPair {
                panelStyle: bind panelStyle;
                action: searchByGenreAction;
                info: "Genre";
                searchName: "Search By Genre"
                values: CategoryUtil.gamesCategories;
                hold: bind searching;
            }
        ]
    }

    public function searchByGenreAction(): Void {
        searching = true;
        var searchTerm = searchByGenre.getValue();
        genre = CategoryUtil { }.gamesCategories[Integer.parseInt(searchTerm)];
        gameReader.byGenre(searchTerm, fillResults)
    }

    public function searchByTitleAction(): Void {
        genre = " - ";
        searching = true;
        gameReader.byTitle(searchByTitle.getValue(), fillResults)
    }

    public function fillResults(games: Game[]): Void {
        for (game in games)
            game.genre = genre;
        gameResultsPanel.games = games;
        searching = false;
    }

}
