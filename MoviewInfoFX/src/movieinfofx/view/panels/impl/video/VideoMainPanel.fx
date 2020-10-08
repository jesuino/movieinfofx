/*
 * VideoMainPanel.fx
 *
 * Created on 07/02/2010, 05:35:54
 */
package movieinfofx.view.panels.impl.video;

import movieinfofx.view.panels.searchPanels.SearchInfoPair;
import movieinfofx.ivaapi.reader.impl.VideoReader;
import movieinfofx.ivaapi.model.Video;
import movieinfofx.util.CategoryUtil;
import movieinfofx.view.panels.MainPanel;
import movieinfofx.view.panels.searchPanels.SearchNode;
import movieinfofx.view.panels.searchPanels.SearchButton;

/**
 * @author william
 */
public class VideoMainPanel extends MainPanel {

    public var videoResultsPanel: VideoSearchResultsPanel =
            VideoSearchResultsPanel {
                panelStyle: bind panelStyle;                
                width: bind width - 30
                searchingStatus: bind videoReader.searchingStatus;
            }
    override var searchResultsPanel = bind videoResultsPanel;
    override var panelTitle = "Video Search";
    var videoReader: VideoReader = VideoReader {}
    var searchByTitle: SearchInfoPair;
    var searchByGenre: SearchInfoPair;
    var searchPopular: SearchButton;

    override public function getSearchPanels(): SearchNode[] {
        [
            searchByTitle = SearchInfoPair {
                panelStyle: bind panelStyle;
                action: searchByTitleAction;
                info: "Title";
                hold: bind searching;
                searchName: "Search By Video Title"
                values: null;
            }
            searchByGenre = SearchInfoPair {
                panelStyle: bind panelStyle;
                action: searchByGenreAction;
                info: "Genre";
                hold: bind searching;
                searchName: "Search By Genre Title";
                values: CategoryUtil.videoCategories;
            }
            searchPopular = SearchButton {
                panelStyle: bind panelStyle;
                searchName: "Popular on Dvd (USA)";
                action: searchPopularOnDvdAction;
                hold: bind searching;
            }
        ]
    }

    public function searchByTitleAction(): Void {
        searching = true;
        videoReader.byTitle(searchByTitle.getValue(), fillResults)
    }

    public function searchByGenreAction(): Void {
        searching = true;
        videoReader.byGenre(searchByGenre.getValue(), fillResults);
    }

    public function searchPopularOnDvdAction(): Void {
        searching = true;
        videoReader.popularDvd(fillResults);
    }

    public function fillResults(videos: Video[]): Void {
        videoResultsPanel.videos = videos;
        searching = false;
    }
}
