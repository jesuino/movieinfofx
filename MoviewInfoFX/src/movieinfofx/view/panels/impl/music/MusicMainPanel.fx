/*
 * MusicMainPanel.fx
 *
 * Created on 07/02/2010, 17:04:09
 */
package movieinfofx.view.panels.impl.music;


import movieinfofx.view.panels.searchPanels.SearchInfoPair;
import movieinfofx.ivaapi.reader.impl.MusicReader;
import movieinfofx.ivaapi.model.Music;
import movieinfofx.util.CategoryUtil;
import movieinfofx.view.panels.MainPanel;
import movieinfofx.view.panels.searchPanels.SearchNode;

/**
 * @author william
 */
public class MusicMainPanel extends MainPanel {

    public var musicResultsPanel: MusicSearchResultsPanel = MusicSearchResultsPanel {
                panelStyle: bind panelStyle;                
                width: bind width - 30;
                searchingStatus: bind reader.searchingStatus;
            };
    override var searchResultsPanel = bind musicResultsPanel;
    override var panelTitle = "Music Search";
    //searchs terms
    var searchByTitle: SearchInfoPair;
    var searchByGenre: SearchInfoPair;
    //reader
    var reader: MusicReader = MusicReader { };

    override public function getSearchPanels():SearchNode[] {
        [
            searchByTitle = SearchInfoPair {
                info: "Title";
                panelStyle: bind panelStyle;
                hold: bind searching;
                searchName: "Search By Title";
                values: null;
                action: searchByTitleAction;
            }
            searchByGenre = SearchInfoPair {
                info: "Genre";
                panelStyle: bind panelStyle;
                searchName: "Search By Genre"
                hold: bind searching
                values: CategoryUtil.musicCategories
                action: searchByGenreAction;
            }
        ]
    }

    function searchByTitleAction(): Void {
        searching = true;
        reader.byTitle(searchByTitle.getValue(), fillResults);
    }

    function searchByGenreAction(): Void {
        searching = true;
        reader.byGenre(searchByGenre.getValue(), fillResults);
    }

    public function fillResults(musics: Music[]): Void {
        musicResultsPanel.musics = musics;
        searching = false;
    }

}
