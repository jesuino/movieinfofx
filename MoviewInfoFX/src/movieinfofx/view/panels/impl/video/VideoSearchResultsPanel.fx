/*
 * VideoSearchResultsPanel.fx
 *
 * Created on 06/02/2010, 17:56:33
 */
package movieinfofx.view.panels.impl.video;

import movieinfofx.view.panels.SearchResultsPanel;
import movieinfofx.ivaapi.model.Video;

/**
 * @author william
 */
public class VideoSearchResultsPanel extends SearchResultsPanel {

    public var videos: Video[];
    override var objects = bind videos;
    override var details = bind VideoDetailsPanel {
                panelStyle: bind panelStyle;              
                object: bind videos[listView.selectedIndex]
            };
}
