/*
 * MusicSearchPanel.fx
 *
 * Created on 07/02/2010, 16:25:17
 */
package movieinfofx.view.panels.impl.music;

import movieinfofx.ivaapi.model.Music;
import movieinfofx.view.panels.SearchResultsPanel;
import movieinfofx.view.panels.impl.music.MusicDetailPanel;

/**
 * @author william
 */
public class MusicSearchResultsPanel extends SearchResultsPanel {

    public var musics: Music[];
    override var objects = bind musics;
    override var details = bind MusicDetailPanel {
                panelStyle: bind panelStyle;
                visible: bind sizeof listView.items > 0;
                object: bind musics[listView.selectedIndex]
            }
}
